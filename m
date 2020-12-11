Return-Path: <jailhouse-dev+bncBDR7HVHPRYHRBN7LZT7AKGQENGQNEYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id E679D2D7277
	for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Dec 2020 10:02:48 +0100 (CET)
Received: by mail-qk1-x73d.google.com with SMTP id o65sf2701372qkc.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 11 Dec 2020 01:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qrGgh45I/lzpJ1PJyFAjodbN4WtE/G9ZQ0usaw3dAEc=;
        b=V/4a1zp6eeFlAO+MnDiarw/1a2sK5yh7uJSwXLgnbAc4ZPaMCN7sVI3VRICrxEVHr8
         kERNj8hQeK5eFqSe8SQf0slKinao9PAAUVIAooV1NOL7MBQSXYoKksX0UMRKUsQLbAJW
         gEP9bAZ4a++MislzH1JBD0W3BspS/JSj1H/x7lgPUm2on/6rJMPeQArFUvxQs9vRpoXt
         Guzyg1JXqw+l6jErWWJTah64Ui6F33lSXPF58aNxZV/XDsQ7AlxTEXsZdTSLvJ/t3Xdo
         JQuXmhM4dcFfUnkepi85iOyVCKYZui2LeLCfHQsy6bjzNQCcvHjvZK9+WdEwStIEYBmo
         GDVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qrGgh45I/lzpJ1PJyFAjodbN4WtE/G9ZQ0usaw3dAEc=;
        b=keh4z278UhfbMMd6LgIhGITYmCKnxrHi1sGcpjSgucKypabIPiA51CjdSot9tgYJ+B
         5vG2nnYw20JMzZE8vGhX4ntX2QXdI4bSmiOc9yJPCdV1sEOOR/pM+ytvpMGw8XYJ4KDs
         YoA2IlJDU8jKecWtF12LezXFiacA2efJmBzdQePcbZl9GJsr/X57X56zalgfpmdNhraw
         x6ekohQAGluQEoWIUj6mvBk3rU7kqYeqBOhi4Hg3iXSR0/ujbu/IN8RnKlFQ1fxDzPKR
         XAlwrMpPPhbZNk21dAPqMa5eitCTtuQ6qKRU3dEj+OmOnnRjQZwf591Q+cMwU5owXgcR
         Omhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qrGgh45I/lzpJ1PJyFAjodbN4WtE/G9ZQ0usaw3dAEc=;
        b=qS8EzGNU0ePAeHkKFVfUcVdhNWuYh5DJZ5jVyv55ruOnqoSmEgbLgiS+6xyIZBL0Vi
         yzHgyE7i/3swI4GV2J82N/KATBF7PUUHOsno05gQhQnxafBLF0YnZUK751/7vwyibAIp
         Z3utAYDKuoBxqIHd6BpYnFHtinWYpdBwS50BSQd9rlB0RkIeBu6N6vBf1N8zB7kEnqcO
         z4enHRN3d0yluWNZ+cDioIw96wrFxRybM1C5to0eFNyd+Zqw5P5DnVaF52d/JAgTw0kL
         1v7FBsvLtqceTz0IAqTqhfXote2RYVBryl9uP/hNW1li1MNxR4SQgzRqLFt6sb2G3xvD
         u4/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531IhI7yYclal8ccwq2h7sJRBTaRcRSBOhdQvB4BfsgNdNZQBEhC
	CvrFCcYUgDG373k77LBNPcY=
X-Google-Smtp-Source: ABdhPJwUpuWIRI+RPFdAI6sOj08MHcoM97qR+zrMOH7MUBWBnKRP5c8Ho1z8UkM/YejNiGHiySZJ0w==
X-Received: by 2002:a05:620a:11ba:: with SMTP id c26mr12702948qkk.140.1607677368061;
        Fri, 11 Dec 2020 01:02:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:572:: with SMTP id p18ls3873274qkp.0.gmail; Fri, 11
 Dec 2020 01:02:47 -0800 (PST)
X-Received: by 2002:a37:c89:: with SMTP id 131mr15329408qkm.468.1607677367341;
        Fri, 11 Dec 2020 01:02:47 -0800 (PST)
Date: Fri, 11 Dec 2020 01:02:46 -0800 (PST)
From: hongbo wang <whbo158@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bc09eba1-2569-4f39-ba00-7b1b2cf5f8c8n@googlegroups.com>
In-Reply-To: <c33c208b-b94f-4764-9a35-722c0b43e483n@googlegroups.com>
References: <20201210105128.25554-1-hongbo.wang@nxp.com>
 <c33c208b-b94f-4764-9a35-722c0b43e483n@googlegroups.com>
Subject: Re: [PATCH v1 0/2] Add configure files and dts for NXP ls1043a RDB
 platform
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1064_1960314918.1607677366526"
X-Original-Sender: whbo158@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_1064_1960314918.1607677366526
Content-Type: multipart/alternative; 
	boundary="----=_Part_1065_971444811.1607677366526"

------=_Part_1065_971444811.1607677366526
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ok, Jiafei
I will modify the patches, and resend them,

Thanks,
hongbo

=E5=9C=A82020=E5=B9=B412=E6=9C=8811=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC=
+8 =E4=B8=8A=E5=8D=8811:17:49<peter...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> Hi, Hongbo,
>
> Now ls1043a silicon v2.0 supports 64K alignment GIC address,  we need to=
=20
> support silicon v2.0 but not v1.0 in opensource community, please update=
=20
> the patches.
>
> Jiafei.
>
> =E5=9C=A82020=E5=B9=B412=E6=9C=8810=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B U=
TC+8 =E4=B8=8B=E5=8D=886:48:42<hongb...@nxp.com> =E5=86=99=E9=81=93=EF=BC=
=9A
>
>> From: "hongbo.wang" <hongb...@nxp.com>=20
>>
>> hongbo.wang (2):=20
>> configs: ls1043a-rdb: add cell configure files=20
>> configs: ls1043a-rdb: Add linux inmate dts demo=20
>>
>> configs/arm64/dts/inmate-ls1043a-rdb.dts | 176 ++++++++=20
>> configs/arm64/ls1043a-rdb-inmate-demo.c | 137 +++++++=20
>> configs/arm64/ls1043a-rdb-linux-demo.c | 165 ++++++++=20
>> configs/arm64/ls1043a-rdb.c | 498 +++++++++++++++++++++++=20
>> 4 files changed, 976 insertions(+)=20
>> create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb.dts=20
>> create mode 100644 configs/arm64/ls1043a-rdb-inmate-demo.c=20
>> create mode 100644 configs/arm64/ls1043a-rdb-linux-demo.c=20
>> create mode 100644 configs/arm64/ls1043a-rdb.c=20
>>
>> --=20
>> 2.17.1=20
>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bc09eba1-2569-4f39-ba00-7b1b2cf5f8c8n%40googlegroups.com.

------=_Part_1065_971444811.1607677366526
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ok, Jiafei<div>I will modify the patches, and resend them,</div><div><br></=
div><div>Thanks,</div><div>hongbo<br><br></div><div class=3D"gmail_quote"><=
div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82020=E5=B9=B412=E6=9C=8811=
=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8 =E4=B8=8A=E5=8D=8811:17:49&lt;pe=
ter...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=
=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(2=
04, 204, 204); padding-left: 1ex;">Hi, Hongbo,<div><br></div><div>Now ls104=
3a silicon v2.0 supports 64K alignment GIC address,=C2=A0 we need to suppor=
t silicon v2.0 but not v1.0 in opensource community, please update the patc=
hes.</div><div><br></div><div>Jiafei.<br><br></div><div class=3D"gmail_quot=
e"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82020=E5=B9=B412=E6=9C=88=
10=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8 =E4=B8=8B=E5=8D=886:48:42&lt;<=
a href data-email-masked rel=3D"nofollow">hongb...@nxp.com</a>&gt; =E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: &quot;hongbo.wang&quot; &lt;<a rel=3D"nofollow">hongb...@nxp.com</a>&=
gt;
<br>
<br>hongbo.wang (2):
<br>  configs: ls1043a-rdb: add cell configure files
<br>  configs: ls1043a-rdb: Add linux inmate dts demo
<br>
<br> configs/arm64/dts/inmate-ls1043a-rdb.dts | 176 ++++++++
<br> configs/arm64/ls1043a-rdb-inmate-demo.c  | 137 +++++++
<br> configs/arm64/ls1043a-rdb-linux-demo.c   | 165 ++++++++
<br> configs/arm64/ls1043a-rdb.c              | 498 +++++++++++++++++++++++
<br> 4 files changed, 976 insertions(+)
<br> create mode 100644 configs/arm64/dts/inmate-ls1043a-rdb.dts
<br> create mode 100644 configs/arm64/ls1043a-rdb-inmate-demo.c
<br> create mode 100644 configs/arm64/ls1043a-rdb-linux-demo.c
<br> create mode 100644 configs/arm64/ls1043a-rdb.c
<br>
<br>--=20
<br>2.17.1
<br>
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bc09eba1-2569-4f39-ba00-7b1b2cf5f8c8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bc09eba1-2569-4f39-ba00-7b1b2cf5f8c8n%40googlegroups.co=
m</a>.<br />

------=_Part_1065_971444811.1607677366526--

------=_Part_1064_1960314918.1607677366526--
