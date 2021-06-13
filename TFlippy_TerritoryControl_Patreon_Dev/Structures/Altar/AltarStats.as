
void AltarStatsInit(CBlob@ altar)
{
    altar.set_string("stats","Test Value\nTest Value\nTest Value\n\n\nTest Valueeeeeeeeeeeeeeeeeeeee");
}

void DrawStats(CBlob@ altar, string stats)
{

    CBlob@ local = getLocalPlayerBlob();
    if(local is null)
    {
        return;
    }

    if(getMap().getBlobAtPosition(local.getAimPos()) !is altar)
    {
        return;
    }

    Driver@ d = getDriver();

    Vec2f ul = altar.getPosition() - Vec2f(4,16);
    ul = d.getScreenPosFromWorldPos(ul);

    Vec2f dim;
    GUI::GetTextDimensions(stats, dim);

    GUI::DrawText(stats + "\n", ul, ul + dim + Vec2f(4,-4), SColor(255,255,255,255), true, true, true);
}

Vec2f getStringDimensions(string s)
{
    string[] lines = s.split('\n');

    u32 longestVal = 0;

    for(u32 i = 0; i < lines.size(); i++)
    {
        string line = lines[i];
        if(line.size() > longestVal)
        {
            longestVal = line.size();
        }
    }
    return Vec2f(longestVal,lines.size());

}