Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBH5RYT5AKGQEWFKCAAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F0725C6A9
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 18:24:00 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id c5sf2455477qtd.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tcdqKHwXpdx07S60M6OpBeINl1pCrkM4n1QnjrnObwQ=;
        b=b5Gobsq6nWofoMwPs/JjzLv2K9KbGaDzoWrTHjlHTkxTJOaval2SckXv1L5FLhfEtK
         wSnfyg9nJL/nXv6VqWZPFJK4BJqp2aggQbbvAPaXB3dd4f5DVSP6O1FFAIpTDLCnHQxY
         fe7Afwfrz+RcmkDM1vOOtNTzZfXBgGRH4Ugy0uC57gtIoJzjytZ4WyQZsJDG1dlpThl+
         tAljGxvGwpANc7z2qoFNEk8AfemPmmrrEfYY+F3V5YgyC1OMYao56QPEuV3DljMWd54O
         2EQ5XkBdHsRLFhWRYRWsgNbZ+Dw+eXTFL47qCDbM7gMLeRXe9JveePnQ2oqCuU/KzV1s
         qaXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tcdqKHwXpdx07S60M6OpBeINl1pCrkM4n1QnjrnObwQ=;
        b=O3cGjrCD1u1e7aKnm48N2Ymvf/dNgoqdVNU9BUgwNnjZd6uGOAANJikTNOt2qdJ4pb
         +zcLZY4osybyubxVGj1Hhs1uHjM9aglNuaatrJDjFdhABNDeS10wPrd1yX2PWeZCw8y8
         xv7RmMUehq4GGIu9KAq1UAZNDVTk2Zj7gNEL79n532R16DJ2B3os1SIKUOxObS1tJmmn
         iDOWaYO2GBM9q0qH/uFXRm5HBWvjP2uV4iSVVUGbhA6oTg1qqEJL57GXcw5t0AFRIq2h
         OW9ogcAXMcgAyPKcRhAIybatAx/QP11touI4TmwCo/jn77asXlI3EsKgl8MGKKEZcqaK
         rDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tcdqKHwXpdx07S60M6OpBeINl1pCrkM4n1QnjrnObwQ=;
        b=IMmjJEpz3sipj3xEFFK/w7LHXwvb2LoWa1hacrnOZK3HHGtByVFlPWXib4ytgBEcH0
         5nH5tylztatR9aXYlAJRwX/lCRWPWDKcGk28aYLTZyxUooB8FGIOIBnOPo0R9prwaNV1
         wzXiwWDRs+uWn0VgoOwb+NIcOUi4YP7U/IzUQIMSOeUcPwn4yaqQPsxyU9UQdmpbh54N
         4O9ncYlkLxSIy3+ErwNzOEl+fjXm1cQZsIcB6e+ZBGcSGmuCAXeO7La0HTvWqanLA5Vs
         b2G2Y1E1LYaVMPvBsO9IRCNdVC6c9u4QkaZAnLJK2OFuKftijSHVH+Dbj0eGVEgfoKri
         2U6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531r0HahrcGPxC02S8cT7TGHNRdYNzXus/44Mcy4X/lUf+DbnP7w
	nUznh1mlJO8Bq+L0w3M1Zq0=
X-Google-Smtp-Source: ABdhPJzMO/AmaVyqW54VXgiPNaLR+pZ0Y8d1bGDa5XUyMkjdReTxY5wB6nTTSivX/y0CDB+SkPvy5w==
X-Received: by 2002:a05:620a:2156:: with SMTP id m22mr3769546qkm.397.1599150239602;
        Thu, 03 Sep 2020 09:23:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:226:: with SMTP id j6ls1467301qvt.9.gmail; Thu, 03
 Sep 2020 09:23:59 -0700 (PDT)
X-Received: by 2002:a0c:b2d4:: with SMTP id d20mr2658847qvf.1.1599150238868;
        Thu, 03 Sep 2020 09:23:58 -0700 (PDT)
Date: Thu, 3 Sep 2020 09:23:57 -0700 (PDT)
From: "vsun...@gmail.com" <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <15b9588b-971c-4664-94ec-42479be2d871n@googlegroups.com>
Subject: imx8: could load 2nd linux in console but not getting how to get
 the shell up in display screen
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_792_1940868835.1599150237810"
X-Original-Sender: vsuneja63@gmail.com
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

------=_Part_792_1940868835.1599150237810
Content-Type: multipart/alternative; 
	boundary="----=_Part_793_951093136.1599150237811"

------=_Part_793_951093136.1599150237811
Content-Type: text/plain; charset="UTF-8"

Hi,

I could load custom image in emmc & that boot up successfully via jailhouse 
non-root cell in console. Root cell image shell getting displayed on hdmi 
but not getting how to display 2nd linux shell on imx8mq evk as 
"imx8mq-evk-inmate.dtb" doesn't have mipi_dsi port for OLED. mipi_dsi port 
is there in "fsl-imx8mq-evk-dcss-rm67191.dtb" only. imx8mq has 1 hdmi & 1 
mipi_dsi display port only. How to achieve this or any other way for 
display?   

Thanks & Regards,
Vipul Kumar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/15b9588b-971c-4664-94ec-42479be2d871n%40googlegroups.com.

------=_Part_793_951093136.1599150237811
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div><div>I could load custom image in emmc &amp; t=
hat boot up successfully via jailhouse non-root cell in console. Root cell =
image shell getting displayed on hdmi but not getting how to display 2nd li=
nux shell on imx8mq evk as "imx8mq-evk-inmate.dtb" doesn't have mipi_dsi po=
rt for OLED. mipi_dsi port is there in "fsl-imx8mq-evk-dcss-rm67191.dtb" on=
ly. imx8mq has 1 hdmi &amp; 1 mipi_dsi display port only. How to achieve th=
is or any other way for display? &nbsp; <br></div><div><br></div><div>Thank=
s &amp; Regards,</div><div>Vipul Kumar<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/15b9588b-971c-4664-94ec-42479be2d871n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/15b9588b-971c-4664-94ec-42479be2d871n%40googlegroups.co=
m</a>.<br />

------=_Part_793_951093136.1599150237811--

------=_Part_792_1940868835.1599150237810--
