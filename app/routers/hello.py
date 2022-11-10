from typing import Optional

from fastapi import APIRouter

router = APIRouter(prefix="/items")


@router.get("/{item_id}")
async def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}
