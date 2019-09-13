Return-Path: <jailhouse-dev+bncBCLLPLFFYUJRBQNF5TVQKGQEEYDRN2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DB6B177F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 Sep 2019 05:53:37 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id r187sf591011wme.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Sep 2019 20:53:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568346817; cv=pass;
        d=google.com; s=arc-20160816;
        b=PqD4pXHobAy90DMhiUgCsa9JF/tJSlGC2BfWaSjNVc9jy5qRurEufb3ySABk1NI1B8
         Mi8PKB3PVcrXxOxZasHKDxR3oRomD3bOwV9BghyTky5t6QIvjkKB554gXdjjny6vRe4I
         S/EbNzQJBEiaMiRVDZRMC/6nKhlEXIzM1XB+gotSfQRUnpeUIr+GM28vg7LQSO0w2LIA
         vedxZS5m08iDQ1jcnBRLOdTZK+9wmpeQZ+GS9NVSIEq+sWoOBFRwUg4J+vmrCgctAZe5
         EHaxZsA3q/lcYiA/zmEV1isR2F9FJjXJQuibgZWWkE7brEe8Luh5JQc8YIN7ljd0rk3S
         V7pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=AeG09d9NvhmZfaQi+zZ2W9OOt/KKx417OQN38ni6FH8=;
        b=YQUjlwWDDWdulDZvEL3lPF+cCqpjwqUM+uHk4ZM7yu08tgWbxvvMuYZpDKMiapDufA
         2ycX8PnU66BX5IapoV++k8ThrXmjVIXppFhOqHcgQezdb7PXuKJJSesgHQX16GAIXczl
         jhb7o+vAZWac/HybIZRR01nSYvSGEhYVwVDmWdu2Mnf5m0J2c7qSewYf51NkSkL665q7
         leCKs9TO4LMJa5xLDqo61oRJIpyBscsADlLB6PEOfzCbeiezOO/ybSLPizuUnSigFQBE
         UyhalFjui9yS7v+irR8Gb51QhrYS68a1wH2J+CYbC2hrINMlXTHNB9+OvWtuiqMh7KDT
         d+Rg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qHAk47lk;
       spf=pass (google.com: domain of patmika28@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=patmika28@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AeG09d9NvhmZfaQi+zZ2W9OOt/KKx417OQN38ni6FH8=;
        b=KvO06w8mvBp4zkgdFGMisb9xR93/SektqIr9XRZfbuI3z/+N5vm++5LBvXbvKmQ+mk
         wWMOkRT8qjeNO+5ztn0m1QYfc2xzLmdPi6rbvIF/L/Pp5eA8Ub6IJIPc0Um9+QPd3b8w
         jCvgRPABWwgzq1vUNNlRcaf9MV8pqrT7cZicuvFijn2Q/EZHVewh4/dnbFdU9fChQ36m
         aHkq/TZcTmBRSKcu8e1Xq4cO+aeqNE5gZJbk8QFOPsWJhOz5ib6lerma+2klMN4dPhs9
         +UAVM2Ja4U8x3DmvE/tFbdNMS/dsL8PXEYThnsLhaGh+6AUZSw53G3nxjsaCY/P/W9fw
         u15A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AeG09d9NvhmZfaQi+zZ2W9OOt/KKx417OQN38ni6FH8=;
        b=PtmL+8ge1bF0sH2HeyIA327E48t2qYtgDV0Tcwksguo1Q8U1EGph9WXX+KVrx35bl1
         ZtM4ZNzCQfOkOSfF97BnXtVcpRLb0pxHoe0Tq4TQaf3wpQHerUAFD9dSD80fI1+QeYbM
         hKUB5gTH84fV/N5NQp/+Bpn+yN7M7L3wFuw3dseP2WDm9iIxnpinBp0s7MuXR7IuGwEa
         R0tmXh7pHkLtnxk1yikxuXUhij5skAjUVKqgZN2lgNDtsH1E0ogvxX4jTHWdweuovE3l
         8ShrfFzLqFV9v9vxl6y4f8m5QM8I7GKZ8f2yNwt5Bo91ixSRKOWT+Gh/YF8TGdwnlKYe
         xrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AeG09d9NvhmZfaQi+zZ2W9OOt/KKx417OQN38ni6FH8=;
        b=gRgRuZpEoDZs0ZJE7IMilmi7Ei1wc1Kb7Ld/gy40LZTwHoGANitvINVzYTe8AWYG1c
         UY+MQyQbqOVnSEtLLvhz3ge1X9r51xpMI4iePJzl/Yy1+bSOwP9/3LWll1KV0Y2gbZvm
         8M4rN2bw60rmh83hDEPNsGJbC+FGSoBmq5C0+C9qtiZrvEo+UE290B/QdqCfoURaE8mp
         ClhkpwEDuyhYUy1AGZnFxjNfB1fKPtDZAVARJWOWCylYl+yfZgoFFs7mN5R3gNIhZgiV
         eVFqwIB08GgNIDoU7KmAFmfv2j9dWmcNke+qD4+CTzV7nNqNauV2u3K/BlfumQeftV2Z
         ervw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW/9dBVYbr55pd5lhms8gEoPzD/w/ylMB2bPNnOcwWwWoiajQvN
	tQBWYex0Mq72OuaAnLwXyrE=
X-Google-Smtp-Source: APXvYqwmmSt+zRm1D5+82Xyf3PZyciWYeuLruBO83RgizOidtINOIOdmRaLsW0TgfWo0xlZ0VBsJiA==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr39507048wru.317.1568346817446;
        Thu, 12 Sep 2019 20:53:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f5c1:: with SMTP id k1ls1133600wrp.0.gmail; Thu, 12 Sep
 2019 20:53:36 -0700 (PDT)
X-Received: by 2002:adf:a415:: with SMTP id d21mr40984701wra.94.1568346816811;
        Thu, 12 Sep 2019 20:53:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568346816; cv=none;
        d=google.com; s=arc-20160816;
        b=hLZy4ZD/Y72B+S/+NKv/x4JiwasPDERUe7OXnyb9LGR/dg96V2KPxIfR1sNxcqzWmo
         ib17aqAVpJ7jIBoPGAw8hUfi/P6RsGatZEea7M/mW5FEZKiA/Gq+J5ehAlhteSsgVroB
         6RPGgcR0i4dRnbpHLiZb+m+VB96nWr0NE7Nxv5agRQbermLnwIpKaWdchiJuyNQtT27E
         UqjYHg1FnPzlh0z0S4JTgIg0nVU1zfM15w/hgSbWY1ThbGTsJzdu9Jw6Uxyn6rBZH2S+
         4DN6kPwCxSzXgwzlJfhWZz9ae/L6Zh/ot/zmvFf/nQq0XXtL+56OncIt4ekvw9QztJVx
         4Ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6H9bmz4HAajv1oWAT7W/zfYvsMg0ReaSAa5Hb8ynXD8=;
        b=wujRV28IocK10hLf5E8EZJJKZpzk2+/Uf09oBinH/pertYhDIqqOOQIpTQnDGOnRI3
         O9o5Kow9rnnUSl+8sAHndtbywPJdBmDaZEvMdTu1307txO1vHUFHetXFl3+x9c4NhTMa
         XI6pwOHAXuIwM+xy9RlWzmD1M84pXEi+oTD0R5qk1oAiZkaJMZO/xoNnIBPOp6iNbZeW
         cqra8yQDLYVqj+wEUEKfC3WgvkkgAyMTAcrpdzgvzH6OjHrhPN+5qpojEJgEKDH3bfWR
         F8ABPu2eu0L+48Ijvr+QW95DMjgk3F3w/z7RGcZRJhSyhAKHvXazhkHZhwWZt0DzjxS9
         x83w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qHAk47lk;
       spf=pass (google.com: domain of patmika28@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) smtp.mailfrom=patmika28@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com. [2a00:1450:4864:20::344])
        by gmr-mx.google.com with ESMTPS id p5si17799wmg.0.2019.09.12.20.53.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2019 20:53:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of patmika28@gmail.com designates 2a00:1450:4864:20::344 as permitted sender) client-ip=2a00:1450:4864:20::344;
Received: by mail-wm1-x344.google.com with SMTP id r17so850481wme.0
        for <jailhouse-dev@googlegroups.com>; Thu, 12 Sep 2019 20:53:36 -0700 (PDT)
X-Received: by 2002:a7b:c401:: with SMTP id k1mr1403563wmi.62.1568346816511;
 Thu, 12 Sep 2019 20:53:36 -0700 (PDT)
MIME-Version: 1.0
From: Patricia Mikando <patmika28@gmail.com>
Date: Fri, 13 Sep 2019 03:53:23 +0000
Message-ID: <CAMFDpzUAwkKRD9CbFi+wN_=mkV1Xy-_6GnUF1kbdMbKowXdsjA@mail.gmail.com>
Subject: wish you all the best
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000e20c3e059267321b"
X-Original-Sender: patmika28@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=qHAk47lk;       spf=pass
 (google.com: domain of patmika28@gmail.com designates 2a00:1450:4864:20::344
 as permitted sender) smtp.mailfrom=patmika28@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000e20c3e059267321b
Content-Type: text/plain; charset="UTF-8"

I hope this email finds you.
I want to know if you received the last message I sent you?
I really want to hear from you.
wish you all the best.
Patricia Mikando......
I look forward to your response.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMFDpzUAwkKRD9CbFi%2BwN_%3DmkV1Xy-_6GnUF1kbdMbKowXdsjA%40mail.gmail.com.

--000000000000e20c3e059267321b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"margin:0px;padding:0px;border:0px;font-varia=
nt-numeric:inherit;font-variant-east-asian:inherit;font-stretch:inherit;fon=
t-size:16px;line-height:inherit;font-family:Calibri,Helvetica,sans-serif;ve=
rtical-align:baseline;color:rgb(0,0,0)"><span style=3D"margin:0px;padding:0=
px;border:0px;font:inherit;vertical-align:baseline;color:inherit"><font fac=
e=3D"comic sans ms, sans-serif">I hope this email finds you.<br></font></sp=
an></div><div style=3D"margin:0px;padding:0px;border:0px;font-variant-numer=
ic:inherit;font-variant-east-asian:inherit;font-stretch:inherit;font-size:1=
6px;line-height:inherit;font-family:Calibri,Helvetica,sans-serif;vertical-a=
lign:baseline;color:rgb(0,0,0)"><font face=3D"comic sans ms, sans-serif"><s=
pan style=3D"margin:0px;padding:0px;border:0px;font:inherit;vertical-align:=
baseline;color:inherit"></span></font></div><div style=3D"margin:0px;paddin=
g:0px;border:0px;font-variant-numeric:inherit;font-variant-east-asian:inher=
it;font-stretch:inherit;font-size:16px;line-height:inherit;font-family:Cali=
bri,Helvetica,sans-serif;vertical-align:baseline;color:rgb(0,0,0)"><div sty=
le=3D"margin:0px;padding:0px;border:0px;font:inherit;vertical-align:baselin=
e;color:inherit"><font face=3D"comic sans ms, sans-serif">I want to know if=
 you received the last message I sent you?<br></font></div><div style=3D"ma=
rgin:0px;padding:0px;border:0px;font:inherit;vertical-align:baseline;color:=
inherit"><font face=3D"comic sans ms, sans-serif">I really want to hear fro=
m you.<br></font></div><div style=3D"margin:0px;padding:0px;border:0px;font=
:inherit;vertical-align:baseline;color:inherit"><font face=3D"comic sans ms=
, sans-serif">wish you all the best.</font></div></div><font face=3D"comic =
sans ms, sans-serif" style=3D"color:rgb(0,0,0);font-size:16px">Patricia Mik=
ando......<br>I look forward to your response.=C2=A0 =C2=A0=C2=A0</font>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAMFDpzUAwkKRD9CbFi%2BwN_%3DmkV1Xy-_6GnUF1kbdMbKow=
XdsjA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAMFDpzUAwkKRD9CbFi%2BwN_%3DmkV1Xy-_6Gn=
UF1kbdMbKowXdsjA%40mail.gmail.com</a>.<br />

--000000000000e20c3e059267321b--
