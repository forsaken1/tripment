import React, { useEffect, useState } from "react"
import { useDispatch, useSelector } from "react-redux"

export default function Procedures() {
  const [searchValue, setSearchValue] = useState('')
  const { collection: searchResults } = useSelector(state => state.procedure)
  const { procedure: { fetchProcedures } } = useDispatch()

  useEffect(() => {
    fetchProcedures('')
  }, [])

  const inputOnChange = (event) => {
    const value = event.target.value
    setSearchValue(value)
    fetchProcedures(value)
  }

  return (
    <div className="procedures__wrapper">
      <div className="procedures">
        <div className="procedures__title">Search procedures</div>
        <div className="procedures__search">
          <input
            className="procedures__input"
            placeholder="Enter procedure..."
            value={searchValue}
            onChange={inputOnChange}
          />
        </div>

        <div className="procedures__list">
          {
            searchResults.length == 0 ? (
              'No Results'
            ) : (
              searchResults.map(procedure =>
                <div className="procedures__item" key={procedure.id}>
                  {procedure.attributes.title}
                  <span className="procedures__item-gray">{procedure.attributes.block}</span>
                </div>  
              )
            )
          }
        </div>
      </div>
    </div>
  )
}
