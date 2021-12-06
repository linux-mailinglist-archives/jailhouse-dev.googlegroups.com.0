Return-Path: <jailhouse-dev+bncBCJPVF5T2ADRBFMMW6GQMGQEF2KDOXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181446913D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Dec 2021 09:13:10 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id w16-20020a05651c103000b00218c9d46faesf3157438ljm.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Dec 2021 00:13:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638778389; cv=pass;
        d=google.com; s=arc-20160816;
        b=v759/jTkTPYuFoCl6uPw4JyXGrIv5+uB5eRl7ltQt7Zy+QQeSGYdaFdVMoXPyJ1qFT
         0we2+RV+Gs1o2jcl799BuiCF2qOYv9Krz9+1LlT59G2z6hOOAErMekRd8tp6Dv7CWga5
         0pV5Bczn8xxqmz2yUaFuN+1ULc7LS4SX+n9abYZWGIUYgyQrO8Thq++bvAQMLT58kEI6
         IcdQDnEr6qN8fIrurUhP7IBTQPRi2ki47n9fAHKx+x36rBZnhZismOoy/Uqqe+NNC45f
         th16NhH969zzFTmEUJNet84/S3Q/zbN91VztnVoaY2o4wzzCFzPAR2majooum/gzPVgb
         vFmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=PGcNo4OqnkMCUBfXaowL2uVd7MklrrWci5PkSPFrS7s=;
        b=jwPcjVAtoFTnr5dwGeBmXBXOf7X/bywmIx2grVR6YiZO8glJWgt4St0hsUHcg5nQvl
         4xq0P9jU06Q463zTzpV7cDsSVXzUCtT+zAx1hD7Ec+3HYNfSskgCjNpjCZ7y6MD8l18O
         9EimHRwYdW9397F3bwrD4a/PusxhbgfSRNlePAq5YYluiUQWh06cBram9cLC9wRyVhd1
         Eg27JEHJdchgwjOPoQ8b6twA3XXAuQsPVxy6xO/5lggWgRx4rahlF9oP4UpMUaxGMFeP
         sZqNozA1ZucRrUfkgmDc4sYanB1y5Xki/IwW0sD8FmoMiVHuHJRZHGAW0uHwxyblRofT
         Y+7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ig7cZMSU;
       spf=pass (google.com: domain of adjallaherica@gmail.com designates 2a00:1450:4864:20::533 as permitted sender) smtp.mailfrom=adjallaherica@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PGcNo4OqnkMCUBfXaowL2uVd7MklrrWci5PkSPFrS7s=;
        b=gTpRV4aFwaZIJa4OhZ16rXdolMxf3QS0JQ3Hoq7Jb5k/sYpeAbG9CTpBRZMzA3GxMi
         rN3N3hE1JFB1zwI8GveYsQIGUZBqwsebh6Gj1JyYvxy43ZtrTwQqTerjFuPioiFDBFz3
         wZf+chM0NRGDpdZjYj0MEAAizD/0IygaT1a3QbsWQ6SuWVOV4s6hbOSVUc/d5g57Zo00
         TDTHaO7ECQyq0pOr+9XCQgotTS/mOAAc2vlUruw5VTHlBFVoRUOjGSA2/op80/kKlLHI
         oDl1yk+BUUN6oY7bDvqNOTmbSA4kYauB+PXFqSqWULsG1pC8ta96uDWo0rx4PQbwE8xj
         Bz7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PGcNo4OqnkMCUBfXaowL2uVd7MklrrWci5PkSPFrS7s=;
        b=i1hmoGaiwa8T0QSkKKlZuY6/dwgIomlGQzdgL0tuSvOAvXVysmoPJqKy9cQjTNhtXx
         OzFBm44tKSlHBqFrAgAVhgrBbQqIXPDH74mPErMXv8KqLiOo9nvk+be+XoljILkzIj1X
         92S4RlblCzp2VwrggXuSlmpb+RjcRGFRVfQzeGbJFouhQavk1znnxIMepuV3zgvzUTkK
         FCqu/P9pDiLtBW6BNn/hUqlBO1MTHrHWXvhyM8f5y4H07us2re4POAxCq0jbW2z6JXAS
         EWx5aaAabH6cgyJHUO6VPJzxeK55cbE/2Mk7EAdvfKpdoJgJjRhopk5mmxPpdOWcgqa3
         +hBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PGcNo4OqnkMCUBfXaowL2uVd7MklrrWci5PkSPFrS7s=;
        b=GZA7pT8cxAaTEj63x6KnL8mP7F+1krU7nsgbM+0hDaMYwdI64myA0/GcKqvE4kclxI
         zX4n/MC1YjYgKgK8+c6LrK49mLIxqdAZF+NmEu+Lscj+2GTt3JjynBYxGyRkAMqeE/oE
         9s3di/KmS/2wq1ZN8ZNIHoIEMtY/SsEtVrka3GANJFdK1bTAhBAWASVMVm+8TrnY8pvD
         0QhNsb6R9um8HRc9XKFQARIQahm9v52ATwyLpb4yizK5fciaDUtNehGrrE27gukAaFMO
         2WakV5rczHRUtvwmyGXD8lV3dIJ5oVyNXTCRvYzJTEVsDhFx0GUIQKB1d+mPocDXlXaj
         WKBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Z6ss3/gSSNQYZLBRjUNYaFeNnDfB+ZHIGQCCWS/72/lG2sj0m
	BVYFpkzSOQSwVTOH5Bi3Rzw=
X-Google-Smtp-Source: ABdhPJyiolEEoeXK5sLPKtDcxWgCNsOjzwuqHi2nIPrH9sljzuIXJtUASYAxXyTlz2/JuK09YrR22A==
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr34088196ljj.275.1638778389781;
        Mon, 06 Dec 2021 00:13:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d9e:: with SMTP id k30ls409998lfv.1.gmail; Mon, 06
 Dec 2021 00:13:08 -0800 (PST)
X-Received: by 2002:a05:6512:2804:: with SMTP id cf4mr32961345lfb.644.1638778388408;
        Mon, 06 Dec 2021 00:13:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638778388; cv=none;
        d=google.com; s=arc-20160816;
        b=ErhbQ5JmI9tXCijzbs3AOHnohLBYE9njcfgdxDeOWvxHTLFDgfiUGiaKkEAP5YuGfN
         fnYH5CCAYQBtNG/+LmNmCe7NANWfupIOmgFlCoWH8BOvcLhS4wlpddc7ZuOWRHtm5Vct
         Xgypwx8fNct0OFNfn3kZO9SYkCWrjNoICOpTKNE1ldJ50WeOWMWeQknTgzsRaLqa73Df
         mY0K6/1FDRVAWFLbUAjTC3kmDUkIFIac3PwssQFmWXm6/AYRJrZ2bZ6rh8mq9loGpCsj
         rdujNJDzPu9/ewiKG1o/b7xRPdg1ElX33I2IIhOQNHj+PaAIsvUEVsbqJ7NwF4jOEZB2
         yjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6VCz90fV7uATxr+uhNJlr6A9Yr4qXaw5oyXz09QmiiY=;
        b=XWtLrN8zbHCBZpam4De4W/dfbFic+V1YtMRQLnxtRe41PSE9fKVDJ1z+8YVELk8btS
         NKrquvs57pCbRBvXVVzkDmLcvO9Ai8uD202AlHr7pSsjnRKaxR1yy10D//jpu6r3pt9V
         20NqQ3QhF38qHrPTlEEk7jSZ2Ak+Erbzt/mPCIlZiZ15XHmAAU4ii2tCFYsp4QzMuKxO
         0BqN+D+Zb52n+w9lY9f1GGpYrjsTpsHtYtneDX43p6BWHcqD+Bq4Dzi0d3gSEHQx308S
         EKAqyyXsy4HjhC7XCRlWS/Elt5OKgOhGUTFN4ZoFjXbhd8NBFbqoplbxRAG+hAxaIMod
         NFWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ig7cZMSU;
       spf=pass (google.com: domain of adjallaherica@gmail.com designates 2a00:1450:4864:20::533 as permitted sender) smtp.mailfrom=adjallaherica@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com. [2a00:1450:4864:20::533])
        by gmr-mx.google.com with ESMTPS id t71si581278lff.6.2021.12.06.00.13.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 00:13:08 -0800 (PST)
Received-SPF: pass (google.com: domain of adjallaherica@gmail.com designates 2a00:1450:4864:20::533 as permitted sender) client-ip=2a00:1450:4864:20::533;
Received: by mail-ed1-x533.google.com with SMTP id w1so39392474edc.6
        for <jailhouse-dev@googlegroups.com>; Mon, 06 Dec 2021 00:13:08 -0800 (PST)
X-Received: by 2002:a50:e683:: with SMTP id z3mr53064875edm.206.1638778387998;
 Mon, 06 Dec 2021 00:13:07 -0800 (PST)
MIME-Version: 1.0
From: Ulrika Jeca Meir <ms.meirjessic@gmail.com>
Date: Mon, 6 Dec 2021 08:12:48 +0000
Message-ID: <CABkd9YzGs+tOBMbnAjQJO+2W1CXVogVRPbtWTRgWGBaGXMbPFA@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000aead6405d275d362"
X-Original-Sender: ms.meirjessic@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=ig7cZMSU;       spf=pass
 (google.com: domain of adjallaherica@gmail.com designates 2a00:1450:4864:20::533
 as permitted sender) smtp.mailfrom=adjallaherica@gmail.com;       dmarc=pass
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

--000000000000aead6405d275d362
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

KuC4quC4p+C4seC4quC4lOC4teC4leC4reC4meC4muC5iOC4suC4oi8gR29vZCBhZnRlcm5vb24q
DQoNCirguIHguKPguLjguJPguLIqICrguITguLjguJPguYTguJTguYnguKPguLHguJrguILguYng
uK3guITguKfguLLguKHguYHguKPguIHguJfguLXguYjguInguLHguJnguKrguYjguIfguJbguLbg
uIfguITguLjguJPguKvguKPguLfguK3guYTguKHguYgqKj8gL3lvdSBzcGVhayBFbmdsaXNoPyoN
Cg0KLS0gCllvdSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgYmVjYXVzZSB5b3UgYXJlIHN1YnNjcmli
ZWQgdG8gdGhlIEdvb2dsZSBHcm91cHMgIkphaWxob3VzZSIgZ3JvdXAuClRvIHVuc3Vic2NyaWJl
IGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQg
YW4gZW1haWwgdG8gamFpbGhvdXNlLWRldit1bnN1YnNjcmliZUBnb29nbGVncm91cHMuY29tLgpU
byB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdv
b2dsZS5jb20vZC9tc2dpZC9qYWlsaG91c2UtZGV2L0NBQmtkOVl6R3MlMkJ0T0JNYm5BalFKTyUy
QjJXMUNYVm9nVlJQYnRXVFJnV0dCYUdYTWJQRkElNDBtYWlsLmdtYWlsLmNvbS4K
--000000000000aead6405d275d362
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0in 0in 10pt;line-h=
eight:115%;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><s=
pan style=3D"font-size:12pt;line-height:115%;font-family:&quot;Cordia New&q=
uot;,&quot;sans-serif&quot;;color:rgb(0,176,80)">=E0=B8=AA=E0=B8=A7=E0=B8=
=B1=E0=B8=AA=E0=B8=94=E0=B8=B5=E0=B8=95=E0=B8=AD=E0=B8=99=E0=B8=9A=E0=B9=88=
=E0=B8=B2=E0=B8=A2/ Good afternoon</span></b><b><span style=3D"font-size:12=
pt;line-height:115%;color:rgb(0,176,80)"></span></b></p>

<p class=3D"MsoNormal" style=3D"margin:0in 0in 10pt;line-height:115%;font-s=
ize:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span style=3D"font=
-size:12pt;line-height:115%;font-family:&quot;Cordia New&quot;,&quot;sans-s=
erif&quot;;color:rgb(0,176,80)">=E0=B8=81=E0=B8=A3=E0=B8=B8=E0=B8=93=E0=B8=
=B2</span></b><b><span style=3D"font-size:12pt;line-height:115%;color:rgb(0=
,176,80)"> </span></b><b><span style=3D"font-size:12pt;line-height:115%;fon=
t-family:&quot;Cordia New&quot;,&quot;sans-serif&quot;;color:rgb(0,176,80)"=
>=E0=B8=84=E0=B8=B8=E0=B8=93=E0=B9=84=E0=B8=94=E0=B9=89=E0=B8=A3=E0=B8=B1=
=E0=B8=9A=E0=B8=82=E0=B9=89=E0=B8=AD=E0=B8=84=E0=B8=A7=E0=B8=B2=E0=B8=A1=E0=
=B9=81=E0=B8=A3=E0=B8=81=E0=B8=97=E0=B8=B5=E0=B9=88=E0=B8=89=E0=B8=B1=E0=B8=
=99=E0=B8=AA=E0=B9=88=E0=B8=87=E0=B8=96=E0=B8=B6=E0=B8=87=E0=B8=84=E0=B8=B8=
=E0=B8=93=E0=B8=AB=E0=B8=A3=E0=B8=B7=E0=B8=AD=E0=B9=84=E0=B8=A1=E0=B9=88</s=
pan></b><b><span style=3D"font-size:12pt;line-height:115%;color:rgb(0,176,8=
0)">? /you speak English?</span></b></p></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CABkd9YzGs%2BtOBMbnAjQJO%2B2W1CXVogVRPbtWTRgWGBaGX=
MbPFA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CABkd9YzGs%2BtOBMbnAjQJO%2B2W1CXVogVRPb=
tWTRgWGBaGXMbPFA%40mail.gmail.com</a>.<br />

--000000000000aead6405d275d362--
