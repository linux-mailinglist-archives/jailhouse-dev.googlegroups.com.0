Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBRG24GYAMGQECVE4ZEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 3049C8A2216
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:07:50 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-dc6dbdcfd39sf590564276.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712876869; x=1713481669; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UAkYUshpVQpesOWvlMcflG8SQFVfRIG2fTUdiwOBAmo=;
        b=ZVHYR9AQB0smrwRoxIc2PS2StoDyGZGAsAR3ngNT1pjZik/eU4VmuWTpBrjMdEQwsH
         z0BJNR9C4Jdzd/e42K6mibrhI9oAPGtXiYiHgR7kapKK4EoBTcw0RP3srb5Bb1N2bYEi
         re9mdNGTEyyV3Mw1l3Ob3w2pCIbgeT31IF4a6FlIEg4QBdq4LJ8JoLKmLvwZdLsaWib7
         DK6J7AWTNvuL1iZu6rTflmb2pOFe/+VZijbcpcQWD5F0QAHWCxkP/hVFHQxrbu4UOnQJ
         grobj3w9eikfhbFKhb+gfe/PYhFzDsdFRaTsnDBACJN+Q3z99+g1q6Enr3RX+4pnB623
         wC7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712876869; x=1713481669; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAkYUshpVQpesOWvlMcflG8SQFVfRIG2fTUdiwOBAmo=;
        b=JV3nQNA1psWg6G01wxpbjMow2TwtrM9dVS6JeMoRGoTMEX3qXLQnVvR3lx9afYuDcp
         lfHy0aZ1r3fZ5bPZgajVAjWKOVz29iZs1MJzvNEsbj9ru3f/12NsAi0AwNPdoNykYK0N
         dkbdqYKAgDAwLcBa5+mGfXnvMWTlzFVadrnXHp6fCKq8k4eIdhm1zeFcJUBlhe91Oh/v
         PcNk6DsKUOI/+2J8z3SM0WW0RIaZ/ypw0ZEBjP7EAu0Jz2sVbb2VqazOf/CD24tVVVQd
         BefK6NhoShIME41cP8djztoWbI7nc21ZysXqCsmc03viqZwYumHJQFbzchkabLmTYyoe
         l3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712876869; x=1713481669;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UAkYUshpVQpesOWvlMcflG8SQFVfRIG2fTUdiwOBAmo=;
        b=Pzg4kNsmmjckwHON8Qf+JIP2F6vARwgkchfSKgos2JyjzIqH6ZnfPKZpZtw6YbzPVQ
         wYVGAVq13/2MHfgIFx5okYe2CjXpTkF5R49sOkg+DINbWqErqb/guv419ukv2Gk1AeOe
         XtKLuSso5tPYz4Be/Ii8c4/gVK3pXuzK9h2D261G5ajSWzyLTxE8p2r1lNeYc9vKmo38
         JFbJrrOLbwPHYGKDx2NwsjbdnMAtbFaSN9iNbMDhaOuMKjSKg2poCOwObc6Qx2whUFCL
         rpZhUAO89jpIGx5DVIbk5q95dv/oCqW2/N+YU9NKvh4YoZXpa/b1tqplonXdAd3Qnu3c
         Bq7Q==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWyj0W6LNT0VWH2R4iuLay0IYUYHvMWhby+QFG6aSSj2GPiCIY5OGOpC27BWWa6yC8AZwG6SCqHN4lLpkjzqlyyUhEC0Y8usb41OJI=
X-Gm-Message-State: AOJu0YyaRMsL2gKA+6jJG6HtlCKWF0nybaihZiXQ+8CgPk0d5GvAGeDI
	BikbB0HdTYVB7UzsZ8unWtWB89+wcnqGz4uaK85KMWUzEDZMVqZo
X-Google-Smtp-Source: AGHT+IFVDmYffc9jJ2LXZTwWmOqa+zl93ZIkbceKpRW5SzOdiDySZfL4dEtfcOrpUL+ToPL6rHOrRA==
X-Received: by 2002:a25:bcd1:0:b0:dcd:72f7:15b8 with SMTP id l17-20020a25bcd1000000b00dcd72f715b8mr938841ybm.11.1712876868904;
        Thu, 11 Apr 2024 16:07:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e0c2:0:b0:dcc:4b24:c0e3 with SMTP id x185-20020a25e0c2000000b00dcc4b24c0e3ls750734ybg.1.-pod-prod-07-us;
 Thu, 11 Apr 2024 16:07:47 -0700 (PDT)
X-Received: by 2002:a25:a1c3:0:b0:dcd:3172:7265 with SMTP id a61-20020a25a1c3000000b00dcd31727265mr229558ybi.8.1712876866840;
        Thu, 11 Apr 2024 16:07:46 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:07:46 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5eb9fb84-85a1-4530-ade0-0d1954e6351dn@googlegroups.com>
In-Reply-To: <CAKu3oWPQypb6cDPLYo4SVcqokmXE00jM04JdOJBggMpS3uZYaQ@mail.gmail.com>
References: <CAKu3oWPQypb6cDPLYo4SVcqokmXE00jM04JdOJBggMpS3uZYaQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6INmK2LPYudiv2YbYpyDYp9iz2KrZgg==?=
 =?UTF-8?B?2KjYp9mEINiu2LfYp9io2KfYqiDYp9mE2KrYsdi0?=
 =?UTF-8?B?2YrYrSAwMDIwMTA2Mjk5MjUxMCDZhtiq2YjYrNmHINin2YTZitmD2YUg2Kg=?=
 =?UTF-8?B?2K7Yp9mE2LUg2KfZhNiq2YLYr9mK2LEg2YjYpw==?=
 =?UTF-8?B?2YTYp9it2KrYsdin2YUsINmI2YrYs9ix2YbYpyA=?=
 =?UTF-8?B?2KfZhNiq2YbZiNmK2Kkg2LnZhiDYtNmH2KfYr9ip?=
 =?UTF-8?B?INin2YTYp9i52KrZhdin2K8sLCwg2KXYr9in?=
 =?UTF-8?B?2LHYqSDYp9mE2YXYtNin2LHZiti5INin2YTYpQ==?=
 =?UTF-8?B?2K3Yqtix2KfZgdmK2KkgKFByb2plY3Q=?=
 =?UTF-8?B?IE1hbmFnZW1lbnQgUHJvZmVzc2lvbmFsIChQTVAg2Kc=?=
 =?UTF-8?B?2YTZgtin2YfYsdipIOKAkyDYrNmF2YfZiNix2Yo=?=
 =?UTF-8?B?2Kkg2YXYtdixINin2YTYudix2KjZitipIC8g?=
 =?UTF-8?B?2KfZiNmGINmE2KfZitmGINmB2Yog2K3Yp9mEIA==?=
 =?UTF-8?B?2KrYudiw2LEg2KfZhNit2LbZiNixINiq2KfYsdmK?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_157702_1480576909.1712876866041"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_157702_1480576909.1712876866041
Content-Type: multipart/alternative; 
	boundary="----=_Part_157703_1524736053.1712876866041"

------=_Part_157703_1524736053.1712876866041
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

TVQxMDMvMjAyIERJUkVDVCBXSVJFIFRSQU5TRkVSClBBWVBBTCBUUkFOU0ZFUgpDQVNIQVBQIFRS
QU5TRkVSClpFTExFIFRSQU5TRkVSCkxPQU4gREVBTApUUkFOU0ZFUiBXSVNFCldFU1RFUk4gVU5J
T04gVFJBTlNGRVIKQklUQ09JTiBGTEFTSElORwpCQU5LIEFDQ09VTlQgTE9BRElORy9GTEFTSElO
RwpJQkFOIFRPIElCQU4gVFJBTlNGRVIKTU9ORVlHUkFNIFRSQU5TRkVSCklQSVAvRFRDClNMQkMg
UFJPVklERVIKQ1JFRElUIENBUkQgVE9QIFVQCkRVTVBTLyBQSU5TClNFUEEgVFJBTlNGRVIKV0lS
RSBUUkFOU0ZFUgpCSVRDT0lOIFRPUCBVUApHTE9CQUxQQVkgSU5DIFVTClNLUklMTCBVU0EKVU5J
T05QQVkgUkVDRUlWRVIKClRoYW5rcy4KCgpOT1RFOyBPTkxZIFNFUklPVVMgLyBSRUxJQUJMRSBS
RUNFSVZFUlMgQ0FOIENPTlRBQ1QuCgpETSBNRSBPTiBXSEFUU0FQUAorNDQgNzUyOSA1NTU2MzgK
Ck9uIFNhdHVyZGF5LCBBdWd1c3QgNSwgMjAyMyBhdCAxOjU5OjU54oCvQU0gVVRDKzEgc2FycWEg
ZHJldiB3cm90ZToKCj4gKtmK2LPYudiv2YbYpyDYp9iz2KrZgtio2KfZhCDYrti32KfYqNin2Kog
2KfZhNiq2LHYtNmK2K0gMDAyMDEwNjI5OTI1MTAqCj4KPiAgCj4KPiAq2YbYqtmI2KzZhyDYp9mE
2YrZg9mFINio2K7Yp9mE2LUg2KfZhNiq2YLYr9mK2LEg2YjYp9mE2KfYrdiq2LHYp9mFLCDZiNmK
2LPYsdmG2Kcg2KfZhNiq2YbZiNmK2Kkg2LnZhiDYtNmH2KfYr9ipINin2YTYp9i52KrZhdin2K8s
LCwqCj4KPiAq2KXYr9in2LHYqSDYp9mE2YXYtNin2LHZiti5INin2YTYpdit2KrYsdin2YHZitip
Kgo+Cj4gKiAoKipQcm9qZWN0IE1hbmFnZW1lbnQgUHJvZmVzc2lvbmFsIChQTVAqCj4KPiAq2KfZ
hNmC2KfZh9ix2Kkg4oCTINis2YXZh9mI2LHZitipINmF2LXYsSDYp9mE2LnYsdio2YrYqSAvINin
2YjZhiDZhNin2YrZhiDZgdmKINit2KfZhCDYqti52LDYsSDYp9mE2K3YttmI2LEqCj4KPiAq2KrY
p9ix2YrYriDYp9mE2KjYr9ihIDogNiDYp9i62LPYt9izIDIwMjMg2YUg4oCTINiq2KfYsdmK2K4g
2KfZhNin2YbYqtmH2KfYoSAzINin2YPYqtmI2KjYsSAyMDIzINmFKgo+Cj4g2YjYp9mE2YXYudiq
2YXYryDZhdmGINin2YTYr9in2LEg2KfZhNi52LHYqNmK2Kkg2YTZhNiq2YbZhdmK2Kkg2KfZhNin
2K/Yp9ix2YrYqSDigJMgQUhBRAo+Cj4g2LTZh9in2K/YqSDYqNiq2LXYr9mK2YIg2K3Zg9mI2YXZ
iiDZiNiq2YjYq9mK2YIg2YXZhiDYrtin2LHYrNmK2Kkg2YPZgNmA2YDZgNin2YHYqSDYp9mE2K/Z
iNmEINin2YTYudix2KjZitipCj4KPiDZhdi52YTZiNmF2KfYqiDYudmGINin2YTYtNmH2KfYr9ip
IDotCj4KPiDZitmF2YPZhiDYp9mE2KfYs9iq2YHYp9iv2Kkg2YXZhiDYr9mI2LHYp9iqIFBNUCDZ
gdmKINmD2YQg2KfZhNiv2YjZhCDYqtmC2LHZitio2YvYp9iMINit2YrYqyDYqtiq2YXYq9mEINmB
2KfYptiv2Kkg2LTZh9in2K/YqSAKPiDYpdiv2KfYsdipINin2YTZhdi02KfYsdmK2Lkg2KfZhNin
2K3Yqtix2KfZgdmK2KkgUE1QINmB2Yog2KPZhtmH2Kcg2YXYudiq2LHZgSDYqNmH2Kcg2LnYp9mE
2YXZitin2YsuINmB2YXYuSDYtNmH2KfYr9ipIFBNUNiMIAo+INmK2YXZg9mG2YMg2KfZhNi52YXZ
hCDZgdmKINij2Yog2LXZhtin2LnYqSDYqtmC2LHZitio2YvYpyDZiNmB2Yog2KPZiiDZhdmD2KfZ
hi4KPgo+INiq2YLYr9mFINi02YfYp9iv2KkgUE1QINin2YTYudiv2YrYryDZhdmGINin2YTZgdmI
2KfYptivINmE2YPZhCDZhdmGINin2YTZhdmI2LjZgdmK2YYg2YjYo9ix2KjYp9ioINi52YXZhNmH
2YUuINit2YrYqyDZitmF2YPZhiAKPiDYp9mE2YXZhti42YXYp9iqINin2YTYqtmKINmE2K/ZitmH
2Kcg2YXYr9ix2KfYoSDZhdi02KfYsdmK2Lkg2YXYudiq2YXYr9mI2YYg2YTYr9mJIFBNUCDYttmF
2KfZhiDYqtiz2YTZitmFINin2YTZhdi02KfYsdmK2Lkg2YHZiiAKPiDYp9mE2YjZgtiqINin2YTZ
hdit2K/YryDZiNmI2YHZgtmL2Kcg2YTZhNmF2YrYstin2YbZitipINin2YTZhdit2K/Yr9ipINio
2KfZhNil2LbYp9mB2Kkg2KXZhNmJINiq2YTYqNmK2Kkg2KzZhdmK2Lkg2KPZh9iv2KfZgSAKPiDY
p9mE2YXYtNix2YjYuS4g2YXZhiDZhtin2K3ZitipINij2K7YsdmJ2Iwg2YrZhdmD2YYg2YTZhNmF
2YjYuNmB2YrZhiDYp9mE2KfYs9iq2YXYqtin2Lkg2KjZhdix2KrYqNin2Kog2KPYudmE2Ykg2YjY
qNin2YTZhdiy2YrYryDZhdmGIAo+INmB2LHYtSDYp9mE2LnZhdmELgo+Cj4g2KrYtNmK2LEg2LTZ
h9in2K/YqSDYpdiv2KfYsdipINin2YTZhdi02KfYsdmK2Lkg2KfZhNin2K3Yqtix2KfZgdmK2Kkg
UE1QINil2YTZiSDYo9mG2YMg2LnYttmIINmF2LnYqtix2YEg2KjZhyDYudin2YTZhdmK2YvYpyDZ
gdmKIAo+INmF2KzZhdmI2LnYqSDZhdmF2YrYstipINmF2YYg2YXYr9mK2LHZiiDYp9mE2YXYtNin
2LHZiti5LiDZg9mF2Kcg2KPZhtmH2Kcg2KrYtNmK2LEg2KXZhNmJINin2YXYqtmE2KfZg9mDINin
2YTZhdmH2KfYsdin2Kog2YjYp9mE2YXYudix2YHYqSAKPiDYp9mE2YTYp9iy2YXYqSDZhNiq2YTY
qNmK2Kkg2YXYqti32YTYqNin2Kog2KPZiiDZhdi02LHZiNi5Lgo+Cj4gKtmB2YjYp9im2K8g2LTZ
h9in2K/YqSAqKlBNUCoqOioKPgo+INmK2YXZg9mGINij2YYg2YrZgdmK2K8g2KfZhNit2LXZiNmE
INi52YTZiSDYtNmH2KfYr9ipIFBNUCDYrdmK2KfYqtmDINin2YTZhdmH2YbZitipINio2LnYr9ip
INi32LHZgi4g2YrZhdmD2YY6Cj4KPiDCtyAgICAgICAgINiy2YrYp9iv2Kkg2YHYsdi12YMg2YHZ
iiDYp9mE2YPYs9ioOiDZiNmB2YLZi9inINmE2KfYs9iq2KjZitin2YYg2LHZiNin2KrYqCBQTUkn
cyBFYXJuaW5nIFBvd2Vy2IwgCj4g2YrYrdi12YQg2KfZhNmF2K3Yqtix2YHZiNmGINin2YTYrdin
2LXZhNmI2YYg2LnZhNmJINi02YfYp9iv2KkgUE1QINi52YTZiSDYsdin2KrYqCDYo9i52YTZiSDZ
hdmGINin2YTZhdit2KrYsdmB2YrZhiDYutmK2LEgCj4g2KfZhNmF2LnYqtmF2K/ZitmGLgo+Cj4g
wrcgICAgICAgICDYudiy2LIg2YXYtdiv2KfZgtmK2KrZgzog2LTZh9in2K/YqSBQTVAg2YXYudiq
2LHZgSDYqNmH2Kcg2YjZhdit2KrYsdmF2Kkg2LnYp9mE2YXZitmL2KfYjCDZiNmH2Yog2KrZiNi2
2K0gCj4g2KfZhNiq2LLYp9mF2YMg2KjZhdmH2YbYqSDYpdiv2KfYsdipINin2YTZhdi02LHZiNi5
Lgo+Cj4gwrcgICAgICAgICDZgdiq2K0g2YHYsdi1INmI2LjZitmB2YrYqTog2KrYqti32YTYqCDY
p9mE2LnYr9mK2K8g2YXZhiDYp9mE2YXYpNiz2LPYp9iqINi02YfYp9iv2KkgUE1QINij2Ygg2KrZ
gdi22YTZh9inIAo+INmE2LTYutmEINmF2YbYp9i12Kgg2KXYr9in2LHYqSDYp9mE2YXYtNin2LHZ
iti52Iwg2YjZitmF2YPZhiDYo9mGINmK2LPYp9i52K/ZgyDYp9mE2K3YtdmI2YQg2LnZhNmJINin
2YTYtNmH2KfYr9ipINmB2Yog2KfZhNiq2YXZitiyINmB2YogCj4g2LPZiNmCINi52YXZhCDYqtmG
2KfZgdiz2YouCj4KPiDCtyAgICAgICAgINiq2K3Ys9mK2YYg2YXZh9in2LHYp9iq2YMg2YHZiiDY
pdiv2KfYsdipINin2YTZhdi02KfYsdmK2Lk6INmK2KrYt9mE2Kgg2KfZhNiq2K3YttmK2LEg2YTY
p9mF2KrYrdin2YYgUE1QIAo+INmB2YfZhdin2Ysg2LnZhdmK2YLYp9mLINmE2YXYqNin2K/YpiDY
pdiv2KfYsdipINin2YTZhdi02KfYsdmK2Lkg2YjYo9mB2LbZhCDYp9mE2YXZhdin2LHYs9in2KrY
jCDZiNin2YTYqtmKINmK2YXZg9mGINij2YYg2KrYrdiz2YYgCj4g2YLYr9ix2KrZgyDYudmE2Ykg
2KXYr9in2LHYqSDYp9mE2YXYtNin2LHZiti5INio2YHYudin2YTZitipLgo+Cj4g2KfZhNij2YfY
r9in2YEg2KfZhNiq2YHYtdmK2YTZitipINmE2YTYqNix2YbYp9mF2Kwg2KfZhNiq2K/YsdmK2KjZ
iiDZhNmE2K3YtdmI2YQg2LnZhNmJINin2YTYtNmH2KfYr9ipCj4KPiDYqNix2YbYp9mF2Kwg2KfY
r9in2LHYqSDYp9mE2YXYtNix2YjYudin2Kog2KfZhNin2K3Yqtix2KfZgdmK2KkgUE1QINmK2LPY
p9i52K8g2YXYr9mK2LHZiiDYp9mE2YXYtNix2YjYudin2Kog2KjYp9mE2YXYpNiz2LPYp9iqIAo+
INmI2KfZhNi02LHZg9in2Kog2YTZhNiq2LnYsdmBINi52YTZiiDYp9mE2YXZh9in2LHYp9iqINin
2YTYudmE2YXZitipINmI2KfZhNiq2LfYqNmK2YLZitipINmI2KfZhNmB2YbZitipINin2YTZhNin
2LLZhdipINmE2KfYr9in2LHYqSDYp9mKIAo+INmF2LTYsdmI2Lkg2KjZhtis2KfYrSDZiNmD2YrZ
gdmK2Kkg2KfZhNiq2K7Yt9mK2Lcg2KfZhNis2YrYryDZhNmE2KfYudmF2KfZhCDYp9mE2LDZiiDZ
itiz2KfYudivINin2YTZhdi02LHZiNi5INi52YTZiiDYp9mE2LHYqNmK2K3ZitipIAo+INmI2KfZ
hNmG2KzYp9itINiMINmD2YXYpyDYp9mG2Ycg2YrYudivINio2LHZhtin2YXYrCDYqtiv2LHZitio
2Yog2YXYqtmI2KfZgdmCINmF2Lkg2YXZhtmH2KzZitipINil2K/Yp9ix2Kkg2KfZhNmF2LTYsdmI
2LnYp9iqINmI2YHZgtin2YsgCj4g2YTZhdi52YfYryDYpdiv2KfYsdipINin2YTZhdi02LHZiNi5
2KfYqiDYp9mE2KfZhdix2YrZg9mKIFBNSSAuINmH2LDYpyDYp9mE2KjYsdmG2KfZhdisINmK2YjZ
gdixINmE2YMg2KfZhNmB2LHYtdipINmE2YTYrdi12YjZhCAKPiDYudmE2Ykg2LTZh9in2K/YqSBQ
TVAg2KfZhNiv2YjZhNmK2Kkg2KfZhNmF2LnYqtmF2K/YqSDZhdmGINiu2YTYp9mEINin2YTYqtiv
2LHZitioINin2YTYp9it2KrYsdin2YHZiiDZiNin2YTZhdiq2YXZitiyINmI2KfZhNiw2YogCj4g
2YrYpNmH2YTZgyDZhNmE2KrZgtiv2YUg2KfZhNmJINin2YXYqtit2KfZhiDYp9mE2YXYudmH2K8g
2KfZhNin2YXYsdmK2YPZiiDZhNin2K/Yp9ix2Kkg2KfZhNmF2LTYp9ix2YrYuSBQTUkg2YjZgdmC
2Kcg2YTYtNix2YjYtyAKPiDYp9mE2YXYudmH2K8uCj4KPiDYqti62LfZitipINmF2LnYsdmB2YrY
qSDYtNin2YXZhNipINmE2YPZhCDZhdmI2KfYttmK2Lkg2KXYr9in2LHYqSDYp9mE2YXYtNix2YjY
udin2KouCj4KPiDYp9mE2KrYudix2YEg2LnZhNmJINmD2YrZgdmK2Kkg2KrYrdiv2YrYryDYp9mE
2KPYudmF2KfZhCDYp9mE2K7Yp9i12Kkg2KjYp9mE2YXYtNix2YjYuSDZiNiq2YPZiNmK2YYg2YHY
sdmCINin2YTYudmF2YQuCj4KPiDYp9mE2YXZhdin2LHYs9ipINin2YTYudmF2YTZitipINmE2YXY
sdin2YLYqNipINin2YTZhdi02LHZiNi5INmI2LbYqNi32YcuCj4KPiDYp9mE2KrYt9io2YrZgiDY
p9mE2LnZhdmE2Yog2YTZhNiq2K7Yt9mK2Lcg2KfZhNiy2YXZhtmKINmI2KfZhNmF2KfZhNmKINmE
2YTZhdi02LHZiNi52KfYqi4KPgo+INiq2LrYt9mK2Kkg2YPZhCDZhdmI2KfYttmK2Lkg2KfZhdiq
2K3Yp9mGIChQTVApINin2YTYqtmKINiq2YXZg9mGINin2YTZhdiq2K/YsdioINmF2YYg2KfYrNiq
2YrYp9iyINin2YTYp9mF2KrYrdin2YYuCj4KPiDYqti32KjZitmCINmF2YfYp9ix2KfYqiDYpdiv
2KfYsdipINin2YTZhdi02KfYsdmK2Lkg2YjYp9mE2KPYr9mI2KfYqiDZiNin2YTYqtmC2YbZitin
2Kog2YTYqtiz2YTZitmFINin2YTZhdi02KfYsdmK2Lkg2YHZiiDYp9mE2YjZgtiqIAo+INin2YTZ
hdit2K/YryDZiNmB2Yog2K3Yr9mI2K8g2KfZhNmF2YrYstin2YbZitipLgo+Cj4g2LTYsditINmD
2KfZhdmEINin2YTZhdmG2YfYrCDYqNi32LHZitmC2Kkg2LPZh9mE2Kkg2YjYqNiz2YrYt9ipINmI
2LTZitmC2KkuCj4KPiDYqti32KjZitmC2KfYqiDYudmF2YTZitipINio2KfYs9iq2K7Yr9in2YUg
2KjYsdmG2KfZhdisIE1pY3Jvc29mdCBQcm9qZWN0Lgo+Cj4g2KfYs9iq2K7Yr9in2YUg2YPYqtin
2Kgg2KXYr9in2LHYqSDYp9mE2YXYtNin2LHZiti5INin2YTZhdi52LHZgdmK2KkgIlBNQk9LIOKA
kyDYp9mE2KXYtdiv2KfYsdin2YTYs9in2K/YsyDZiNin2YTYp9i12K/Yp9ixIAo+INin2YTYs9in
2KjYuSIg2YjYr9mE2YrZhCDZhdmF2KfYsdiz2KkgQWdpbGUg2YjZgdmH2YUg2YXYqti32YTYqNin
2Kog2LTZh9in2K/YqSDYp9iu2KrYqNin2LEgUE1QINmI2YbYtdin2KbYrSDZhNin2KzYqtmK2KfY
siAKPiDYp9mE2KfYrtiq2KjYp9ixCj4KPiDZhNmE2KrYs9is2YrZhCDZiNin2YTYp9i02KrYsdin
2YMg2YHZiiDYp9mE2LTZh9in2K/Yp9iqINin2YTZhdmH2YbZitipINin2YTZhdi52KrZhdiv2KkK
Pgo+ICrZhti02YPYsdmDINi52YTZiSDYq9mC2KrZgyDYp9mE2LrYp9mE2YrYqSDYp9mE2KrZiSDZ
hti52KrYsiDYqNmH2Kcg2YHZiSDYqNiv2KfZitipINiq2LnYp9mI2YYg2YXYq9mF2LEg2Ygg2KjZ
htin2KEg2KXZhiDYtNin2KEgCj4g2KfZhNmE2YcsINmI2YrZhdmD2YbZgyDYp9mE2KXYtNiq2LHY
p9mDINmI2KfZhNiq2LPYrNmK2YQg2YPYp9mE2KLYqtmKKio6Kgo+Cj4g2KrZgNij2YPZgNmK2K8g
2KfZhNin2LTYqtix2KfZgyA6Cj4KPiDZitiq2YUg2KrYo9mD2YrYryDYp9mE2KfYtNiq2LHYp9mD
INio2LnYryDYs9iv2KfYryDYsdiz2YjZhSDYp9mE2LTZh9in2K/YqSDYs9mI2KfYoSDZhtmC2K/Y
pyDYo9mIINio2LTZitmDINij2Ygg2KjYp9mE2KrYrdmI2YrZhCAKPiDYp9mE2KjZhtmD2YouCj4K
PiDZg9mK2YHZitipINin2YTYqtiz2KzZitmEINmI2KfZhNin2LTYqtix2KfZgzoKPgo+ICrYs9in
2LHYqSDYudio2K8g2KfZhNis2YjYp9ivKgo+Cj4gKjAwMjAxMDYyOTkyNTEwIC8gMDAyMDEwOTY4
NDE2MjYqCj4KPiAgCj4KPiAgCj4KPiAgCj4KDQotLSAKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2Fn
ZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAiSmFpbGhv
dXNlIiBncm91cC4KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2Vp
dmluZyBlbWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBqYWlsaG91c2UtZGV2K3Vuc3Vi
c2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20uClRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3
ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYv
NWViOWZiODQtODVhMS00NTMwLWFkZTAtMGQxOTU0ZTYzNTFkbiU0MGdvb2dsZWdyb3Vwcy5jb20u
Cg==
------=_Part_157703_1524736053.1712876866041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Saturday, August 5, 2023 at 1:59:59=E2=80=AFAM UTC+1 sarqa drev wrote:<br/=
></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bord=
er-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div dir=3D"rtl"=
><p class=3D"MsoNormal" dir=3D"RTL" style=3D"margin:0in 0in 0.0001pt;direct=
ion:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot;Times New Roman=
&quot;,&quot;serif&quot;"><b><span lang=3D"AR-SA" style=3D"font-size:22pt;c=
olor:rgb(49,132,155)">=D9=8A=D8=B3=D8=B9=D8=AF=D9=86=D8=A7
=D8=A7=D8=B3=D8=AA=D9=82=D8=A8=D8=A7=D9=84 =D8=AE=D8=B7=D8=A7=D8=A8=D8=A7=
=D8=AA =D8=A7=D9=84=D8=AA=D8=B1=D8=B4=D9=8A=D8=AD 00201062992510</span></b>=
<b><span dir=3D"LTR" style=3D"font-size:22pt;font-family:Arial,&quot;sans-s=
erif&quot;;color:rgb(49,132,155)"></span></b></p>

<p class=3D"MsoNormal" dir=3D"RTL" style=3D"margin:0in 0in 0.0001pt;directi=
on:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;"><b><span lang=3D"AR-EG" style=3D"font-size:22pt;co=
lor:rgb(49,132,155)">=C2=A0</span></b></p>

<p class=3D"MsoNormal" dir=3D"RTL" style=3D"margin:0in 0in 0.0001pt;directi=
on:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;"><b><span lang=3D"AR-EG" style=3D"font-size:22pt;co=
lor:rgb(49,132,155)">=D9=86=D8=AA=D9=88=D8=AC=D9=87 =D8=A7=D9=84=D9=8A=D9=
=83=D9=85 =D8=A8=D8=AE=D8=A7=D9=84=D8=B5 =D8=A7=D9=84=D8=AA=D9=82=D8=AF=D9=
=8A=D8=B1 =D9=88=D8=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=85, =D9=88=D9=
=8A=D8=B3=D8=B1=D9=86=D8=A7 =D8=A7=D9=84=D8=AA=D9=86=D9=88=D9=8A=D8=A9 =D8=
=B9=D9=86
=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D8=A7=D9=84=D8=A7=D8=B9=D8=AA=D9=85=D8=A7=
=D8=AF,,,</span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 0.0001pt;direction:rtl;unicode-bidi:embed;font-size:12pt=
;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=
=3D"AR-SA" style=3D"font-size:36pt;color:rgb(23,54,93)">=D8=A5=D8=AF=D8=A7=
=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9
=D8=A7=D9=84=D8=A5=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A=D8=A9</span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 0.0001pt;direction:rtl;unicode-bidi:embed;font-size:12pt=
;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=
=3D"AR-SA" style=3D"font-size:24pt;color:rgb(49,132,155)">=C2=A0(</span></b=
><b><span dir=3D"LTR" style=3D"font-size:24pt;font-family:Arial,&quot;sans-=
serif&quot;;color:rgb(49,132,155)">Project Management Professional (PMP</sp=
an></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 0.0001pt;direction:rtl;unicode-bidi:embed;font-size:12pt=
;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=
=3D"AR-EG" style=3D"font-size:20pt;font-family:&quot;Simplified Arabic&quot=
;,&quot;serif&quot;;color:black">=D8=A7=D9=84=D9=82=D8=A7=D9=87=D8=B1=D8=A9=
 =E2=80=93
=D8=AC=D9=85=D9=87=D9=88=D8=B1=D9=8A=D8=A9 =D9=85=D8=B5=D8=B1 =D8=A7=D9=84=
=D8=B9=D8=B1=D8=A8=D9=8A=D8=A9 / =D8=A7=D9=88=D9=86 =D9=84=D8=A7=D9=8A=D9=
=86 =D9=81=D9=8A =D8=AD=D8=A7=D9=84 =D8=AA=D8=B9=D8=B0=D8=B1 =D8=A7=D9=84=
=D8=AD=D8=B6=D9=88=D8=B1</span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 0.0001pt;direction:rtl;unicode-bidi:embed;font-size:12pt=
;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=
=3D"AR-EG" style=3D"font-size:20pt;font-family:&quot;Simplified Arabic&quot=
;,&quot;serif&quot;;color:rgb(148,54,52)">=D8=AA=D8=A7=D8=B1=D9=8A=D8=AE =
=D8=A7=D9=84=D8=A8=D8=AF=D8=A1 : 6 =D8=A7=D8=BA=D8=B3=D8=B7=D8=B3 2023 =D9=
=85 =E2=80=93 =D8=AA=D8=A7=D8=B1=D9=8A=D8=AE =D8=A7=D9=84=D8=A7=D9=86=D8=AA=
=D9=87=D8=A7=D8=A1 3
=D8=A7=D9=83=D8=AA=D9=88=D8=A8=D8=B1 2023 =D9=85</span></b></p>

<p align=3D"center" dir=3D"RTL" style=3D"margin:0in 0in 0.0001pt;text-align=
:center;background-image:initial;background-position:initial;background-siz=
e:initial;background-repeat:initial;background-origin:initial;background-cl=
ip:initial;direction:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quo=
t;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-EG" style=3D"fo=
nt-size:22pt;color:rgb(23,54,93);letter-spacing:0.25pt">=D9=88=D8=A7=D9=84=
=D9=85=D8=B9=D8=AA=D9=85=D8=AF =D9=85=D9=86 =D8=A7=D9=84=D8=AF=D8=A7=D8=B1 =
=D8=A7=D9=84=D8=B9=D8=B1=D8=A8=D9=8A=D8=A9 =D9=84=D9=84=D8=AA=D9=86=D9=85=
=D9=8A=D8=A9 =D8=A7=D9=84=D8=A7=D8=AF=D8=A7=D8=B1=D9=8A=D8=A9 =E2=80=93=C2=
=A0</span><span dir=3D"LTR" style=3D"font-size:22pt;font-family:Cambria,&qu=
ot;serif&quot;;color:rgb(23,54,93);letter-spacing:0.25pt">AHAD</span><span =
lang=3D"AR-SA" style=3D"font-size:26pt;font-family:Arial,&quot;sans-serif&q=
uot;;color:rgb(23,54,93);letter-spacing:0.25pt"></span></p>

<p align=3D"center" dir=3D"RTL" style=3D"margin:0in 0in 15pt;text-align:cen=
ter;background-image:initial;background-position:initial;background-size:in=
itial;background-repeat:initial;background-origin:initial;background-clip:i=
nitial;direction:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-EG" style=3D"font-s=
ize:22pt;color:rgb(23,54,93);letter-spacing:0.25pt">=D8=B4=D9=87=D8=A7=D8=
=AF=D8=A9 =D8=A8=D8=AA=D8=B5=D8=AF=D9=8A=D9=82 =D8=AD=D9=83=D9=88=D9=85=D9=
=8A =D9=88=D8=AA=D9=88=D8=AB=D9=8A=D9=82 =D9=85=D9=86
=D8=AE=D8=A7=D8=B1=D8=AC=D9=8A=D8=A9 =D9=83=D9=80=D9=80=D9=80=D9=80=D8=A7=
=D9=81=D8=A9 =D8=A7=D9=84=D8=AF=D9=88=D9=84 =D8=A7=D9=84=D8=B9=D8=B1=D8=A8=
=D9=8A=D8=A9</span></p>

<p dir=3D"RTL" style=3D"margin:0in 0in 15pt;background-image:initial;backgr=
ound-position:initial;background-size:initial;background-repeat:initial;bac=
kground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:e=
mbed;font-size:12pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quo=
t;"><span lang=3D"AR-EG" style=3D"font-size:22pt;color:rgb(148,54,52);lette=
r-spacing:0.25pt">=D9=85=D8=B9=D9=84=D9=88=D9=85=D8=A7=D8=AA
=D8=B9=D9=86 =D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 :-</span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-EG" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D9=8A=D9=85=D9=83=D9=86 =D8=A7=D9=84=D8=A7=D8=B3=D8=
=AA=D9=81=D8=A7=D8=AF=D8=A9
=D9=85=D9=86 =D8=AF=D9=88=D8=B1=D8=A7=D8=AA</span><span dir=3D"LTR"></span>=
<span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-fam=
ily:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><spa=
n dir=3D"LTR"></span> PMP </span><span lang=3D"AR-EG" style=3D"font-size:16=
pt;color:black;letter-spacing:0.25pt">=D9=81=D9=8A =D9=83=D9=84 =D8=A7=D9=
=84=D8=AF=D9=88=D9=84
=D8=AA=D9=82=D8=B1=D9=8A=D8=A8=D9=8B=D8=A7=D8=8C =D8=AD=D9=8A=D8=AB =D8=AA=
=D8=AA=D9=85=D8=AB=D9=84 =D9=81=D8=A7=D8=A6=D8=AF=D8=A9 =D8=B4=D9=87=D8=A7=
=D8=AF=D8=A9 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=
=D8=B1=D9=8A=D8=B9 =D8=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A=
=D8=A9</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D=
"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing=
:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span> PMP </span><spa=
n lang=3D"AR-EG" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt"=
>=D9=81=D9=8A =D8=A3=D9=86=D9=87=D8=A7 =D9=85=D8=B9=D8=AA=D8=B1=D9=81 =D8=
=A8=D9=87=D8=A7 =D8=B9=D8=A7=D9=84=D9=85=D9=8A=D8=A7=D9=8B. =D9=81=D9=85=D8=
=B9
=D8=B4=D9=87=D8=A7=D8=AF=D8=A9</span><span dir=3D"LTR"></span><span dir=3D"=
LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;co=
lor:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"=
></span> PMP</span><span dir=3D"RTL"></span><span dir=3D"RTL"></span><span =
lang=3D"AR-EG" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt"><=
span dir=3D"RTL"></span><span dir=3D"RTL"></span>=D8=8C =D9=8A=D9=85=D9=83=
=D9=86=D9=83 =D8=A7=D9=84=D8=B9=D9=85=D9=84 =D9=81=D9=8A =D8=A3=D9=8A =D8=
=B5=D9=86=D8=A7=D8=B9=D8=A9 =D8=AA=D9=82=D8=B1=D9=8A=D8=A8=D9=8B=D8=A7 =D9=
=88=D9=81=D9=8A =D8=A3=D9=8A =D9=85=D9=83=D8=A7=D9=86</span><span dir=3D"LT=
R"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16p=
t;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"><=
/span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-EG" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-EG" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D9=82=D8=AF=D9=85 =D8=B4=D9=87=D8=A7=D8=AF=D8=
=A9</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LT=
R" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing:0.=
25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span> PMP </span><span l=
ang=3D"AR-EG" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=
=D8=A7=D9=84=D8=B9=D8=AF=D9=8A=D8=AF =D9=85=D9=86 =D8=A7=D9=84=D9=81=D9=88=
=D8=A7=D8=A6=D8=AF =D9=84=D9=83=D9=84 =D9=85=D9=86 =D8=A7=D9=84=D9=85=D9=88=
=D8=B8=D9=81=D9=8A=D9=86
=D9=88=D8=A3=D8=B1=D8=A8=D8=A7=D8=A8 =D8=B9=D9=85=D9=84=D9=87=D9=85. =D8=AD=
=D9=8A=D8=AB =D9=8A=D9=85=D9=83=D9=86 =D8=A7=D9=84=D9=85=D9=86=D8=B8=D9=85=
=D8=A7=D8=AA =D8=A7=D9=84=D8=AA=D9=8A =D9=84=D8=AF=D9=8A=D9=87=D8=A7 =D9=85=
=D8=AF=D8=B1=D8=A7=D8=A1 =D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =D9=85=D8=B9=
=D8=AA=D9=85=D8=AF=D9=88=D9=86 =D9=84=D8=AF=D9=89</span><span dir=3D"LTR"><=
/span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;fo=
nt-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></spa=
n><span dir=3D"LTR"></span> PMP </span><span lang=3D"AR-EG" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D8=B6=D9=85=D8=A7=D9=86 =D8=AA=
=D8=B3=D9=84=D9=8A=D9=85 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =
=D9=81=D9=8A =D8=A7=D9=84=D9=88=D9=82=D8=AA
=D8=A7=D9=84=D9=85=D8=AD=D8=AF=D8=AF =D9=88=D9=88=D9=81=D9=82=D9=8B=D8=A7 =
=D9=84=D9=84=D9=85=D9=8A=D8=B2=D8=A7=D9=86=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=
=D8=AD=D8=AF=D8=AF=D8=A9 =D8=A8=D8=A7=D9=84=D8=A5=D8=B6=D8=A7=D9=81=D8=A9 =
=D8=A5=D9=84=D9=89 =D8=AA=D9=84=D8=A8=D9=8A=D8=A9 =D8=AC=D9=85=D9=8A=D8=B9 =
=D8=A3=D9=87=D8=AF=D8=A7=D9=81 =D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9. =
=D9=85=D9=86 =D9=86=D8=A7=D8=AD=D9=8A=D8=A9
=D8=A3=D8=AE=D8=B1=D9=89=D8=8C =D9=8A=D9=85=D9=83=D9=86 =D9=84=D9=84=D9=85=
=D9=88=D8=B8=D9=81=D9=8A=D9=86 =D8=A7=D9=84=D8=A7=D8=B3=D8=AA=D9=85=D8=AA=
=D8=A7=D8=B9 =D8=A8=D9=85=D8=B1=D8=AA=D8=A8=D8=A7=D8=AA =D8=A3=D8=B9=D9=84=
=D9=89 =D9=88=D8=A8=D8=A7=D9=84=D9=85=D8=B2=D9=8A=D8=AF =D9=85=D9=86 =D9=81=
=D8=B1=D8=B5 =D8=A7=D9=84=D8=B9=D9=85=D9=84</span><span dir=3D"LTR"></span>=
<span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-fam=
ily:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><spa=
n dir=3D"LTR"></span>.</span><span lang=3D"AR-EG" style=3D"font-size:16pt;c=
olor:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-EG" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=B4=D9=8A=D8=B1 =D8=B4=D9=87=D8=A7=D8=AF=D8=
=A9
=D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=
=D8=B9 =D8=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A=D8=A9</span><=
span dir=3D"LTR"></span><span dir=3D"LTR"></span><span lang=3D"AR-EG" dir=
=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spac=
ing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span> </span><span=
 dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-=
spacing:0.25pt">PMP </span><span lang=3D"AR-EG" style=3D"font-size:16pt;col=
or:black;letter-spacing:0.25pt">=D8=A5=D9=84=D9=89 =D8=A3=D9=86=D9=83 =D8=
=B9=D8=B6=D9=88 =D9=85=D8=B9=D8=AA=D8=B1=D9=81 =D8=A8=D9=87 =D8=B9=D8=A7=D9=
=84=D9=85=D9=8A=D9=8B=D8=A7 =D9=81=D9=8A =D9=85=D8=AC=D9=85=D9=88=D8=B9=D8=
=A9 =D9=85=D9=85=D9=8A=D8=B2=D8=A9 =D9=85=D9=86 =D9=85=D8=AF=D9=8A=D8=B1=D9=
=8A =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9. =D9=83=D9=85=D8=A7 =
=D8=A3=D9=86=D9=87=D8=A7
=D8=AA=D8=B4=D9=8A=D8=B1 =D8=A5=D9=84=D9=89 =D8=A7=D9=85=D8=AA=D9=84=D8=A7=
=D9=83=D9=83 =D8=A7=D9=84=D9=85=D9=87=D8=A7=D8=B1=D8=A7=D8=AA =D9=88=D8=A7=
=D9=84=D9=85=D8=B9=D8=B1=D9=81=D8=A9 =D8=A7=D9=84=D9=84=D8=A7=D8=B2=D9=85=
=D8=A9 =D9=84=D8=AA=D9=84=D8=A8=D9=8A=D8=A9 =D9=85=D8=AA=D8=B7=D9=84=D8=A8=
=D8=A7=D8=AA =D8=A3=D9=8A =D9=85=D8=B4=D8=B1=D9=88=D8=B9</span><span dir=3D=
"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:=
16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR=
"></span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-EG" style=3D"fon=
t-size:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><b><span lang=3D"AR-SA" style=3D"font-size:16pt;color:rgb(=
148,54,52);letter-spacing:0.25pt">=D9=81=D9=88=D8=A7=D8=A6=D8=AF =D8=B4=D9=
=87=D8=A7=D8=AF=D8=A9 </span></b><b><span dir=3D"LTR" style=3D"font-size:16=
pt;font-family:SimSun;color:rgb(148,54,52);letter-spacing:0.25pt">PMP</span=
></b><span dir=3D"RTL"></span><span dir=3D"RTL"></span><b><span lang=3D"AR-=
SA" style=3D"font-size:16pt;color:rgb(148,54,52);letter-spacing:0.25pt"><sp=
an dir=3D"RTL"></span><span dir=3D"RTL"></span>:</span></b><b><span dir=3D"=
LTR" style=3D"font-size:16pt;font-family:SimSun;color:rgb(148,54,52);letter=
-spacing:0.25pt"></span></b></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D9=8A=D9=85=D9=83=D9=86 =D8=A3=D9=86 =D9=8A=D9=81=D9=
=8A=D8=AF =D8=A7=D9=84=D8=AD=D8=B5=D9=88=D9=84 =D8=B9=D9=84=D9=89 =D8=B4=D9=
=87=D8=A7=D8=AF=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:16pt;font=
-family:SimSun;color:black;letter-spacing:0.25pt">PMP</span><span dir=3D"RT=
L"></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-size:=
16pt;color:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><span dir=
=3D"RTL"></span> =D8=AD=D9=8A=D8=A7=D8=AA=D9=83 =D8=A7=D9=84=D9=85=D9=87=D9=
=86=D9=8A=D8=A9
=D8=A8=D8=B9=D8=AF=D8=A9 =D8=B7=D8=B1=D9=82. =D9=8A=D9=85=D9=83=D9=86:</spa=
n></p>

<p dir=3D"RTL" style=3D"margin-right:0.5in;background-image:initial;backgro=
und-position:initial;background-size:initial;background-repeat:initial;back=
ground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:em=
bed;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,=
&quot;serif&quot;"><span style=3D"font-size:10pt;font-family:Symbol;color:b=
lack;letter-spacing:0.25pt">=C2=B7<span style=3D"font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-hei=
ght:normal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D8=B2=D9=8A=D8=A7=D8=AF=D8=A9 =
=D9=81=D8=B1=D8=B5=D9=83 =D9=81=D9=8A
=D8=A7=D9=84=D9=83=D8=B3=D8=A8: =D9=88=D9=81=D9=82=D9=8B=D8=A7 =D9=84=D8=A7=
=D8=B3=D8=AA=D8=A8=D9=8A=D8=A7=D9=86 =D8=B1=D9=88=D8=A7=D8=AA=D8=A8 </span>=
<span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;le=
tter-spacing:0.25pt">PMI&#39;s Earning Power</span><span dir=3D"RTL"></span=
><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-size:16pt;colo=
r:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><span dir=3D"RTL"><=
/span>=D8=8C
=D9=8A=D8=AD=D8=B5=D9=84 =D8=A7=D9=84=D9=85=D8=AD=D8=AA=D8=B1=D9=81=D9=88=
=D9=86 =D8=A7=D9=84=D8=AD=D8=A7=D8=B5=D9=84=D9=88=D9=86 =D8=B9=D9=84=D9=89 =
=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:=
16pt;font-family:SimSun;color:black;letter-spacing:0.25pt">PMP</span><span =
dir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"f=
ont-size:16pt;color:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><=
span dir=3D"RTL"></span> =D8=B9=D9=84=D9=89 =D8=B1=D8=A7=D8=AA=D8=A8 =D8=A3=
=D8=B9=D9=84=D9=89
=D9=85=D9=86 =D8=A7=D9=84=D9=85=D8=AD=D8=AA=D8=B1=D9=81=D9=8A=D9=86 =D8=BA=
=D9=8A=D8=B1 =D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF=D9=8A=D9=86.</span>=
</p>

<p dir=3D"RTL" style=3D"margin-right:0.5in;background-image:initial;backgro=
und-position:initial;background-size:initial;background-repeat:initial;back=
ground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:em=
bed;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,=
&quot;serif&quot;"><span style=3D"font-size:10pt;font-family:Symbol;color:b=
lack;letter-spacing:0.25pt">=C2=B7<span style=3D"font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-hei=
ght:normal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D8=B9=D8=B2=D8=B2 =D9=85=D8=B5=
=D8=AF=D8=A7=D9=82=D9=8A=D8=AA=D9=83:
=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:=
16pt;font-family:SimSun;color:black;letter-spacing:0.25pt">PMP</span><span =
dir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"f=
ont-size:16pt;color:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><=
span dir=3D"RTL"></span> =D9=85=D8=B9=D8=AA=D8=B1=D9=81 =D8=A8=D9=87=D8=A7 =
=D9=88=D9=85=D8=AD=D8=AA=D8=B1=D9=85=D8=A9 =D8=B9=D8=A7=D9=84=D9=85=D9=8A=
=D9=8B=D8=A7=D8=8C =D9=88=D9=87=D9=8A =D8=AA=D9=88=D8=B6=D8=AD =D8=A7=D9=84=
=D8=AA=D8=B2=D8=A7=D9=85=D9=83 =D8=A8=D9=85=D9=87=D9=86=D8=A9 =D8=A5=D8=AF=
=D8=A7=D8=B1=D8=A9
=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9.</span></p>

<p dir=3D"RTL" style=3D"margin-right:0.5in;background-image:initial;backgro=
und-position:initial;background-size:initial;background-repeat:initial;back=
ground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:em=
bed;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,=
&quot;serif&quot;"><span style=3D"font-size:10pt;font-family:Symbol;color:b=
lack;letter-spacing:0.25pt">=C2=B7<span style=3D"font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-hei=
ght:normal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D9=81=D8=AA=D8=AD =D9=81=D8=B1=
=D8=B5 =D9=88=D8=B8=D9=8A=D9=81=D9=8A=D8=A9:
=D8=AA=D8=AA=D8=B7=D9=84=D8=A8 =D8=A7=D9=84=D8=B9=D8=AF=D9=8A=D8=AF =D9=85=
=D9=86 =D8=A7=D9=84=D9=85=D8=A4=D8=B3=D8=B3=D8=A7=D8=AA =D8=B4=D9=87=D8=A7=
=D8=AF=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:S=
imSun;color:black;letter-spacing:0.25pt">PMP</span><span dir=3D"RTL"></span=
><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-size:16pt;colo=
r:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><span dir=3D"RTL"><=
/span> =D8=A3=D9=88 =D8=AA=D9=81=D8=B6=D9=84=D9=87=D8=A7 =D9=84=D8=B4=D8=BA=
=D9=84
=D9=85=D9=86=D8=A7=D8=B5=D8=A8 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=
=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9=D8=8C =D9=88=D9=8A=D9=85=D9=83=D9=86 =
=D8=A3=D9=86 =D9=8A=D8=B3=D8=A7=D8=B9=D8=AF=D9=83 =D8=A7=D9=84=D8=AD=D8=B5=
=D9=88=D9=84 =D8=B9=D9=84=D9=89 =D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =
=D9=81=D9=8A =D8=A7=D9=84=D8=AA=D9=85=D9=8A=D8=B2 =D9=81=D9=8A =D8=B3=D9=88=
=D9=82 =D8=B9=D9=85=D9=84
=D8=AA=D9=86=D8=A7=D9=81=D8=B3=D9=8A.</span></p>

<p dir=3D"RTL" style=3D"margin-right:0.5in;background-image:initial;backgro=
und-position:initial;background-size:initial;background-repeat:initial;back=
ground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:em=
bed;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,=
&quot;serif&quot;"><span style=3D"font-size:10pt;font-family:Symbol;color:b=
lack;letter-spacing:0.25pt">=C2=B7<span style=3D"font-variant-numeric:norma=
l;font-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-hei=
ght:normal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:16pt;color:black;letter-spacing:0.25pt">=D8=AA=D8=AD=D8=B3=D9=8A=D9=86 =
=D9=85=D9=87=D8=A7=D8=B1=D8=A7=D8=AA=D9=83 =D9=81=D9=8A
=D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=
=D8=B9: =D9=8A=D8=AA=D8=B7=D9=84=D8=A8 =D8=A7=D9=84=D8=AA=D8=AD=D8=B6=D9=8A=
=D8=B1 =D9=84=D8=A7=D9=85=D8=AA=D8=AD=D8=A7=D9=86 </span><span dir=3D"LTR" =
style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25p=
t">PMP</span><span dir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=
=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt"><span=
 dir=3D"RTL"></span><span dir=3D"RTL"></span> =D9=81=D9=87=D9=85=D8=A7=D9=
=8B =D8=B9=D9=85=D9=8A=D9=82=D8=A7=D9=8B
=D9=84=D9=85=D8=A8=D8=A7=D8=AF=D8=A6 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=
=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =D9=88=D8=A3=D9=81=D8=B6=D9=84 =
=D8=A7=D9=84=D9=85=D9=85=D8=A7=D8=B1=D8=B3=D8=A7=D8=AA=D8=8C =D9=88=D8=A7=
=D9=84=D8=AA=D9=8A =D9=8A=D9=85=D9=83=D9=86 =D8=A3=D9=86 =D8=AA=D8=AD=D8=B3=
=D9=86 =D9=82=D8=AF=D8=B1=D8=AA=D9=83 =D8=B9=D9=84=D9=89 =D8=A5=D8=AF=D8=A7=
=D8=B1=D8=A9
=D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =D8=A8=D9=81=D8=B9=D8=A7=
=D9=84=D9=8A=D8=A9.</span><span dir=3D"LTR" style=3D"font-size:16pt;font-fa=
mily:SimSun;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:rgb(148=
,54,52);letter-spacing:0.25pt">=D8=A7=D9=84=D8=A3=D9=87=D8=AF=D8=A7=D9=81 =
=D8=A7=D9=84=D8=AA=D9=81=D8=B5=D9=8A=D9=84=D9=8A=D8=A9 =D9=84=D9=84=D8=A8=
=D8=B1=D9=86=D8=A7=D9=85=D8=AC =D8=A7=D9=84=D8=AA=D8=AF=D8=B1=D9=8A=D8=A8=
=D9=8A =D9=84=D9=84=D8=AD=D8=B5=D9=88=D9=84 =D8=B9=D9=84=D9=89
=D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A9</span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A8=D8=B1=D9=86=D8=A7=D9=85=D8=AC =D8=A7=D8=AF=D8=
=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA =D8=
=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A=D8=A9</span><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-si=
ze:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"=
LTR"></span><span dir=3D"LTR"></span> PMP </span><span lang=3D"AR-SA" style=
=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=8A=D8=B3=D8=A7=D8=
=B9=D8=AF =D9=85=D8=AF=D9=8A=D8=B1=D9=8A
=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA =D8=A8=D8=A7=D9=84=
=D9=85=D8=A4=D8=B3=D8=B3=D8=A7=D8=AA =D9=88=D8=A7=D9=84=D8=B4=D8=B1=D9=83=
=D8=A7=D8=AA =D9=84=D9=84=D8=AA=D8=B9=D8=B1=D9=81 =D8=B9=D9=84=D9=8A =D8=A7=
=D9=84=D9=85=D9=87=D8=A7=D8=B1=D8=A7=D8=AA =D8=A7=D9=84=D8=B9=D9=84=D9=85=
=D9=8A=D8=A9 =D9=88=D8=A7=D9=84=D8=AA=D8=B7=D8=A8=D9=8A=D9=82=D9=8A=D8=A9 =
=D9=88=D8=A7=D9=84=D9=81=D9=86=D9=8A=D8=A9
=D8=A7=D9=84=D9=84=D8=A7=D8=B2=D9=85=D8=A9 =D9=84=D8=A7=D8=AF=D8=A7=D8=B1=
=D8=A9 =D8=A7=D9=8A =D9=85=D8=B4=D8=B1=D9=88=D8=B9 =D8=A8=D9=86=D8=AC=D8=A7=
=D8=AD =D9=88=D9=83=D9=8A=D9=81=D9=8A=D8=A9 =D8=A7=D9=84=D8=AA=D8=AE=D8=B7=
=D9=8A=D8=B7 =D8=A7=D9=84=D8=AC=D9=8A=D8=AF =D9=84=D9=84=D8=A7=D8=B9=D9=85=
=D8=A7=D9=84 =D8=A7=D9=84=D8=B0=D9=8A =D9=8A=D8=B3=D8=A7=D8=B9=D8=AF =D8=A7=
=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9
=D8=B9=D9=84=D9=8A =D8=A7=D9=84=D8=B1=D8=A8=D9=8A=D8=AD=D9=8A=D8=A9 =D9=88=
=D8=A7=D9=84=D9=86=D8=AC=D8=A7=D8=AD =D8=8C =D9=83=D9=85=D8=A7 =D8=A7=D9=86=
=D9=87 =D9=8A=D8=B9=D8=AF =D8=A8=D8=B1=D9=86=D8=A7=D9=85=D8=AC =D8=AA=D8=AF=
=D8=B1=D9=8A=D8=A8=D9=8A =D9=85=D8=AA=D9=88=D8=A7=D9=81=D9=82 =D9=85=D8=B9 =
=D9=85=D9=86=D9=87=D8=AC=D9=8A=D8=A9 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9
=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA =D9=88=D9=81=D9=82=
=D8=A7=D9=8B =D9=84=D9=85=D8=B9=D9=87=D8=AF =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =
=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA =D8=A7=D9=84=D8=A7=
=D9=85=D8=B1=D9=8A=D9=83=D9=8A</span><span dir=3D"LTR"></span><span dir=3D"=
LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;co=
lor:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"=
></span> PMI . </span><span lang=3D"AR-SA" style=3D"font-size:16pt;color:bl=
ack;letter-spacing:0.25pt">=D9=87=D8=B0=D8=A7 =D8=A7=D9=84=D8=A8=D8=B1=D9=
=86=D8=A7=D9=85=D8=AC =D9=8A=D9=88=D9=81=D8=B1
=D9=84=D9=83 =D8=A7=D9=84=D9=81=D8=B1=D8=B5=D8=A9 =D9=84=D9=84=D8=AD=D8=B5=
=D9=88=D9=84 =D8=B9=D9=84=D9=89 =D8=B4=D9=87=D8=A7=D8=AF=D8=A9</span><span =
dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font=
-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span> PMP </span><span lang=3D"AR-SA" s=
tyle=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D8=A7=D9=84=D8=
=AF=D9=88=D9=84=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF=D8=
=A9
=D9=85=D9=86 =D8=AE=D9=84=D8=A7=D9=84 =D8=A7=D9=84=D8=AA=D8=AF=D8=B1=D9=8A=
=D8=A8 =D8=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A =D9=88=D8=A7=
=D9=84=D9=85=D8=AA=D9=85=D9=8A=D8=B2 =D9=88=D8=A7=D9=84=D8=B0=D9=8A =D9=8A=
=D8=A4=D9=87=D9=84=D9=83 =D9=84=D9=84=D8=AA=D9=82=D8=AF=D9=85 =D8=A7=D9=84=
=D9=89 =D8=A7=D9=85=D8=AA=D8=AD=D8=A7=D9=86 =D8=A7=D9=84=D9=85=D8=B9=D9=87=
=D8=AF
=D8=A7=D9=84=D8=A7=D9=85=D8=B1=D9=8A=D9=83=D9=8A =D9=84=D8=A7=D8=AF=D8=A7=
=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9</span><span d=
ir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-=
size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span> PMI </span><span lang=3D"AR-SA" s=
tyle=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=88=D9=81=D9=
=82=D8=A7 =D9=84=D8=B4=D8=B1=D9=88=D8=B7 =D8=A7=D9=84=D9=85=D8=B9=D9=87=D8=
=AF</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LT=
R" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing:0.=
25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span>.</span><span lang=
=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt"></spa=
n></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=BA=D8=B7=D9=8A=D8=A9 =D9=85=D8=B9=D8=B1=D9=
=81=D9=8A=D8=A9 =D8=B4=D8=A7=D9=85=D9=84=D8=A9 =D9=84=D9=83=D9=84 =D9=85=D9=
=88=D8=A7=D8=B6=D9=8A=D8=B9 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=
=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA</span><span dir=3D"LTR"></span><spa=
n dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:=
SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span di=
r=3D"LTR"></span>.</span><span lang=3D"AR-SA" style=3D"font-size:16pt;color=
:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A7=D9=84=D8=AA=D8=B9=D8=B1=D9=81 =D8=B9=D9=84=D9=
=89 =D9=83=D9=8A=D9=81=D9=8A=D8=A9 =D8=AA=D8=AD=D8=AF=D9=8A=D8=AF =D8=A7=D9=
=84=D8=A3=D8=B9=D9=85=D8=A7=D9=84 =D8=A7=D9=84=D8=AE=D8=A7=D8=B5=D8=A9 =D8=
=A8=D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9 =D9=88=D8=AA=D9=83=D9=88=D9=
=8A=D9=86 =D9=81=D8=B1=D9=82 =D8=A7=D9=84=D8=B9=D9=85=D9=84</span><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-si=
ze:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"=
LTR"></span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-SA" style=3D"=
font-size:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A7=D9=84=D9=85=D9=85=D8=A7=D8=B1=D8=B3=D8=A9 =D8=
=A7=D9=84=D8=B9=D9=85=D9=84=D9=8A=D8=A9 =D9=84=D9=85=D8=B1=D8=A7=D9=82=D8=
=A8=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9 =D9=88=D8=B6=D8=A8=D8=
=B7=D9=87</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=
=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spac=
ing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span>.</span><span=
 lang=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=
</span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A7=D9=84=D8=AA=D8=B7=D8=A8=D9=8A=D9=82 =D8=A7=D9=
=84=D8=B9=D9=85=D9=84=D9=8A =D9=84=D9=84=D8=AA=D8=AE=D8=B7=D9=8A=D8=B7 =D8=
=A7=D9=84=D8=B2=D9=85=D9=86=D9=8A =D9=88=D8=A7=D9=84=D9=85=D8=A7=D9=84=D9=
=8A =D9=84=D9=84=D9=85=D8=B4=D8=B1=D9=88=D8=B9=D8=A7=D8=AA</span><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-si=
ze:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"=
LTR"></span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-SA" style=3D"=
font-size:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=BA=D8=B7=D9=8A=D8=A9 =D9=83=D9=84 =D9=85=D9=
=88=D8=A7=D8=B6=D9=8A=D8=B9 =D8=A7=D9=85=D8=AA=D8=AD=D8=A7=D9=86</span><spa=
n dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"fo=
nt-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span di=
r=3D"LTR"></span><span dir=3D"LTR"></span> (PMP) </span><span lang=3D"AR-SA=
" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D8=A7=D9=84=
=D8=AA=D9=8A =D8=AA=D9=85=D9=83=D9=86 =D8=A7=D9=84=D9=85=D8=AA=D8=AF=D8=B1=
=D8=A8
=D9=85=D9=86 =D8=A7=D8=AC=D8=AA=D9=8A=D8=A7=D8=B2 =D8=A7=D9=84=D8=A7=D9=85=
=D8=AA=D8=AD=D8=A7=D9=86</span><span dir=3D"LTR"></span><span dir=3D"LTR"><=
/span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:bl=
ack;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></spa=
n>.</span><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-s=
pacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=B7=D8=A8=D9=8A=D9=82 =D9=85=D9=87=D8=A7=D8=
=B1=D8=A7=D8=AA =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=
=A7=D8=B1=D9=8A=D8=B9 =D9=88=D8=A7=D9=84=D8=A3=D8=AF=D9=88=D8=A7=D8=AA =D9=
=88=D8=A7=D9=84=D8=AA=D9=82=D9=86=D9=8A=D8=A7=D8=AA =D9=84=D8=AA=D8=B3=D9=
=84=D9=8A=D9=85 =D8=A7=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=8A=D8=B9 =D9=81=D9=
=8A =D8=A7=D9=84=D9=88=D9=82=D8=AA
=D8=A7=D9=84=D9=85=D8=AD=D8=AF=D8=AF =D9=88=D9=81=D9=8A =D8=AD=D8=AF=D9=88=
=D8=AF =D8=A7=D9=84=D9=85=D9=8A=D8=B2=D8=A7=D9=86=D9=8A=D8=A9</span><span d=
ir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-=
size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=
=3D"LTR"></span><span dir=3D"LTR"></span>.</span><span lang=3D"AR-SA" style=
=3D"font-size:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=B4=D8=B1=D8=AD =D9=83=D8=A7=D9=85=D9=84 =D8=A7=D9=
=84=D9=85=D9=86=D9=87=D8=AC =D8=A8=D8=B7=D8=B1=D9=8A=D9=82=D8=A9 =D8=B3=D9=
=87=D9=84=D8=A9 =D9=88=D8=A8=D8=B3=D9=8A=D8=B7=D8=A9 =D9=88=D8=B4=D9=8A=D9=
=82=D8=A9</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=
=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-spac=
ing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span>.</span><span=
 lang=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=
</span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=AA=D8=B7=D8=A8=D9=8A=D9=82=D8=A7=D8=AA =D8=B9=D9=
=85=D9=84=D9=8A=D8=A9 =D8=A8=D8=A7=D8=B3=D8=AA=D8=AE=D8=AF=D8=A7=D9=85 =D8=
=A8=D8=B1=D9=86=D8=A7=D9=85=D8=AC</span><span dir=3D"LTR"></span><span dir=
=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSu=
n;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=3D"=
LTR"></span> Microsoft Project.</span><span lang=3D"AR-SA" style=3D"font-si=
ze:16pt;color:black;letter-spacing:0.25pt"></span></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=D8=A7=D8=B3=D8=AA=D8=AE=D8=AF=D8=A7=D9=85 =D9=83=D8=
=AA=D8=A7=D8=A8 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=B4=D8=
=A7=D8=B1=D9=8A=D8=B9 =D8=A7=D9=84=D9=85=D8=B9=D8=B1=D9=81=D9=8A=D8=A9 &quo=
t;</span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color=
:black;letter-spacing:0.25pt">PMBOK</span><span dir=3D"RTL"></span><span di=
r=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt"><span dir=3D"RTL"></span><span dir=3D"RTL"></span>
=E2=80=93 =D8=A7=D9=84=D8=A5=D8=B5=D8=AF=D8=A7=D8=B1=D8=A7=D9=84=D8=B3=D8=
=A7=D8=AF=D8=B3 =D9=88=D8=A7=D9=84=D8=A7=D8=B5=D8=AF=D8=A7=D8=B1 =D8=A7=D9=
=84=D8=B3=D8=A7=D8=A8=D8=B9&quot; =D9=88=D8=AF=D9=84=D9=8A=D9=84 =D9=85=D9=
=85=D8=A7=D8=B1=D8=B3=D8=A9 </span><span dir=3D"LTR" style=3D"font-size:16p=
t;font-family:SimSun;color:black;letter-spacing:0.25pt">Agile</span><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"fo=
nt-size:16pt;color:black;letter-spacing:0.25pt"><span dir=3D"RTL"></span><s=
pan dir=3D"RTL"></span>
=D9=88=D9=81=D9=87=D9=85 =D9=85=D8=AA=D8=B7=D9=84=D8=A8=D8=A7=D8=AA =D8=B4=
=D9=87=D8=A7=D8=AF=D8=A9 =D8=A7=D8=AE=D8=AA=D8=A8=D8=A7=D8=B1 </span><span =
dir=3D"LTR" style=3D"font-size:16pt;font-family:SimSun;color:black;letter-s=
pacing:0.25pt">PMP</span><span dir=3D"RTL"></span><span dir=3D"RTL"></span>=
<span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;letter-spacing:0.2=
5pt"><span dir=3D"RTL"></span><span dir=3D"RTL"></span> =D9=88=D9=86=D8=B5=
=D8=A7=D8=A6=D8=AD =D9=84=D8=A7=D8=AC=D8=AA=D9=8A=D8=A7=D8=B2
=D8=A7=D9=84=D8=A7=D8=AE=D8=AA=D8=A8=D8=A7=D8=B1</span></p>

<p align=3D"center" dir=3D"RTL" style=3D"text-align:center;background-image=
:initial;background-position:initial;background-size:initial;background-rep=
eat:initial;background-origin:initial;background-clip:initial;direction:rtl=
;unicode-bidi:embed;margin-right:0in;margin-left:0in;font-size:12pt;font-fa=
mily:&quot;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-SA" st=
yle=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=84=D9=84=D8=AA=
=D8=B3=D8=AC=D9=8A=D9=84 =D9=88=D8=A7=D9=84=D8=A7=D8=B4=D8=AA=D8=B1=D8=A7=
=D9=83 =D9=81=D9=8A =D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A7=D8=AA =D8=A7=
=D9=84=D9=85=D9=87=D9=86=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=
=D8=AF=D8=A9</span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:Si=
mSun;color:black;letter-spacing:0.25pt"></span></p>

<p align=3D"center" dir=3D"RTL" style=3D"text-align:center;direction:rtl;un=
icode-bidi:embed;margin-right:0in;margin-left:0in;font-size:12pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=3D"AR-SA" st=
yle=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=86=D8=B4=D9=83=
=D8=B1=D9=83 =D8=B9=D9=84=D9=89 =D8=AB=D9=82=D8=AA=D9=83 =D8=A7=D9=84=D8=BA=
=D8=A7=D9=84=D9=8A=D8=A9 =D8=A7=D9=84=D8=AA=D9=89 =D9=86=D8=B9=D8=AA=D8=B2 =
=D8=A8=D9=87=D8=A7 =D9=81=D9=89 =D8=A8=D8=AF=D8=A7=D9=8A=D8=A9 =D8=AA=D8=B9=
=D8=A7=D9=88=D9=86 =D9=85=D8=AB=D9=85=D8=B1 =D9=88 =D8=A8=D9=86=D8=A7=D8=A1=
 =D8=A5=D9=86 =D8=B4=D8=A7=D8=A1
=D8=A7=D9=84=D9=84=D9=87, =D9=88=D9=8A=D9=85=D9=83=D9=86=D9=83 =D8=A7=D9=84=
=D8=A5=D8=B4=D8=AA=D8=B1=D8=A7=D9=83 =D9=88=D8=A7=D9=84=D8=AA=D8=B3=D8=AC=
=D9=8A=D9=84 =D9=83=D8=A7=D9=84=D8=A2=D8=AA=D9=8A</span></b><span dir=3D"LT=
R"></span><span dir=3D"LTR"></span><b><span dir=3D"LTR" style=3D"font-size:=
16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR=
"></span><span dir=3D"LTR"></span>:</span></b><span dir=3D"LTR" style=3D"fo=
nt-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"></span><=
/p>

<p align=3D"center" dir=3D"RTL" style=3D"text-align:center;direction:rtl;un=
icode-bidi:embed;margin-right:0in;margin-left:0in;font-size:12pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-SA" style=
=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D8=AA=D9=80=D8=A3=D9=
=83=D9=80=D9=8A=D8=AF =D8=A7=D9=84=D8=A7=D8=B4=D8=AA=D8=B1=D8=A7=D9=83</spa=
n><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=
=3D"font-size:16pt;font-family:SimSun;color:black;letter-spacing:0.25pt"><s=
pan dir=3D"LTR"></span><span dir=3D"LTR"></span> :</span></p>

<p align=3D"center" dir=3D"RTL" style=3D"text-align:center;direction:rtl;un=
icode-bidi:embed;margin-right:0in;margin-left:0in;font-size:12pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-SA" style=
=3D"font-size:16pt;color:black;letter-spacing:0.25pt">=D9=8A=D8=AA=D9=85 =
=D8=AA=D8=A3=D9=83=D9=8A=D8=AF =D8=A7=D9=84=D8=A7=D8=B4=D8=AA=D8=B1=D8=A7=
=D9=83 =D8=A8=D8=B9=D8=AF =D8=B3=D8=AF=D8=A7=D8=AF =D8=B1=D8=B3=D9=88=D9=85=
 =D8=A7=D9=84=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D8=B3=D9=88=D8=A7=D8=A1 =D9=86=
=D9=82=D8=AF=D8=A7 =D8=A3=D9=88 =D8=A8=D8=B4=D9=8A=D9=83 =D8=A3=D9=88 =D8=
=A8=D8=A7=D9=84=D8=AA=D8=AD=D9=88=D9=8A=D9=84
=D8=A7=D9=84=D8=A8=D9=86=D9=83=D9=8A</span><span dir=3D"LTR"></span><span d=
ir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:16pt;font-family:Sim=
Sun;color:black;letter-spacing:0.25pt"><span dir=3D"LTR"></span><span dir=
=3D"LTR"></span>.</span></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"margin:15pt 0in 7.5pt;text=
-align:center;background-image:initial;background-position:initial;backgrou=
nd-size:initial;background-repeat:initial;background-origin:initial;backgro=
und-clip:initial;direction:ltr;unicode-bidi:embed;font-size:12pt;font-famil=
y:&quot;Times New Roman&quot;,&quot;serif&quot;"><span lang=3D"AR-SA" dir=
=3D"RTL" style=3D"font-size:18pt;font-family:Arial,&quot;sans-serif&quot;;c=
olor:rgb(53,53,53)">=D9=83=D9=8A=D9=81=D9=8A=D8=A9 =D8=A7=D9=84=D8=AA=D8=B3=
=D8=AC=D9=8A=D9=84
=D9=88=D8=A7=D9=84=D8=A7=D8=B4=D8=AA=D8=B1=D8=A7=D9=83</span><span dir=3D"L=
TR"></span><span dir=3D"LTR"></span><span style=3D"font-size:18pt;font-fami=
ly:Arial,&quot;sans-serif&quot;;color:rgb(53,53,53)"><span dir=3D"LTR"></sp=
an><span dir=3D"LTR"></span>:</span></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in 0in 7.5pt;text-=
align:center;background-image:initial;background-position:initial;backgroun=
d-size:initial;background-repeat:initial;background-origin:initial;backgrou=
nd-clip:initial;direction:ltr;unicode-bidi:embed;font-size:12pt;font-family=
:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=3D"AR-SA" dir=
=3D"RTL" style=3D"font-size:20pt;font-family:Arial,&quot;sans-serif&quot;;c=
olor:rgb(148,54,52)">=D8=B3=D8=A7=D8=B1=D8=A9 =D8=B9=D8=A8=D8=AF =D8=A7=D9=
=84=D8=AC=D9=88=D8=A7=D8=AF</span></b></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"margin:0in 0in 7.5pt;text-=
align:center;background-image:initial;background-position:initial;backgroun=
d-size:initial;background-repeat:initial;background-origin:initial;backgrou=
nd-clip:initial;direction:ltr;unicode-bidi:embed;font-size:12pt;font-family=
:&quot;Times New Roman&quot;,&quot;serif&quot;"><b><span lang=3D"AR-SA" dir=
=3D"RTL" style=3D"font-size:20pt;font-family:Arial,&quot;sans-serif&quot;;c=
olor:rgb(148,54,52)">00201062992510 / 00201096841626</span></b><b><span sty=
le=3D"font-size:20pt;font-family:Arial,&quot;sans-serif&quot;;color:rgb(148=
,54,52)"></span></b></p>

<p dir=3D"RTL" style=3D"background-image:initial;background-position:initia=
l;background-size:initial;background-repeat:initial;background-origin:initi=
al;background-clip:initial;direction:rtl;unicode-bidi:embed;margin-right:0i=
n;margin-left:0in;font-size:12pt;font-family:&quot;Times New Roman&quot;,&q=
uot;serif&quot;"><span lang=3D"AR-SA" style=3D"font-size:16pt;color:black;l=
etter-spacing:0.25pt">=C2=A0</span></p>

<p dir=3D"RTL" style=3D"margin:0in 0in 15pt;background-image:initial;backgr=
ound-position:initial;background-size:initial;background-repeat:initial;bac=
kground-origin:initial;background-clip:initial;direction:rtl;unicode-bidi:e=
mbed;font-size:12pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quo=
t;"><span lang=3D"AR-EG" style=3D"font-size:16pt;color:rgb(23,54,93);letter=
-spacing:0.25pt">=C2=A0</span></p>

<p class=3D"MsoNormal" dir=3D"RTL" style=3D"margin:0in 0in 0.0001pt;directi=
on:rtl;unicode-bidi:embed;font-size:12pt;font-family:&quot;Times New Roman&=
quot;,&quot;serif&quot;"><span dir=3D"LTR" style=3D"font-size:9pt;font-fami=
ly:SimSun">=C2=A0</span></p></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5eb9fb84-85a1-4530-ade0-0d1954e6351dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5eb9fb84-85a1-4530-ade0-0d1954e6351dn%40googlegroups.co=
m</a>.<br />

------=_Part_157703_1524736053.1712876866041--

------=_Part_157702_1480576909.1712876866041--
