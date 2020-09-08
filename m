Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBEO2335AKGQEZ6B2AUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2309626143F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 18:11:00 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id l1sf9496835qvr.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 09:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vCsuWD1QaTyPB6QrX1139dxiD+mixVBlccLJX6Sbdb8=;
        b=SMcRUvBf8t9nu5vCyegpD2UpGyHssv63vinUDD8W//v5grymZFvEZAvF/G2uY+otRb
         FRLJvVmUQua/yuUaKey47RsC/AtVkUqrRfqGK+qmWpUHg1M1QmaRdgmtEakK7AWumMzG
         HJNN2Sv0MOHgN7gdMVrDFjP7kawKGvBm2F1XQeDOK30Q0lSJDISUJZxzKzgc7yPH68ga
         vYPBWs26TQnR1XC6xNKCvIxSb5ds3dUit/O+zjcMZZcVURRWIEw/9dYV1n7RWgfloYy1
         Z39ZiED15mOrl79OfKRNGsYBXAIFIynB+e7lFZ+UakXLnJ6ixLPy1Y5588T63MeYpR1A
         rQYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vCsuWD1QaTyPB6QrX1139dxiD+mixVBlccLJX6Sbdb8=;
        b=bFx2W+KAKTc+9CklF5FSz8V+XHDdHMmJkfSd0FXcEfP+4ZmohyQScAcjcK4P4Jx+m7
         zynvWCg4o1ogwfJmqoexrUVdH7jWx7WMTpNbx862JEyTlIHW3dmTCopjZyrv0XMQVD1Y
         hm0L88an2eNEr2tuLs6wpvaxhUydLSHdcFwFCVPD6kG24hghH4zcO4Hpas5w+0/Nw+DE
         AOFouOEB9yR7Vo6sUOuksWFjieV7lEaxvalm2pvESnlbQKzq1SwCpdUi1RP0GKx4sMkT
         xy1jB6IBTHIZUOx23XWKENilpT9tq/5kSk+ZZzWZV27UAIM+PgDfaYJqFF+vW0HXLby1
         4c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vCsuWD1QaTyPB6QrX1139dxiD+mixVBlccLJX6Sbdb8=;
        b=e4lNsOqtXX4kdAjQY8H8q4cQ1lKWNX35t9SDcRpwdZmPGQ8SgJQ5hN2pYObO4JXcuO
         4P+Y7NOOV4GIV6c8rOBaUMWjBOeU8GEMYYknZpJ8cvMoV7JLcc4JYQ1vowRWDif16c02
         ho6TobZipdqexKSQjrtx45CvU+tFkTZVisMawG1MoJ4wpA/XCO09qrp31vEJoYg3/AKZ
         z/KGClSHgnYOpYiD2k7KCcZxuAsCZDBT8n1im4z74/Zb9FHkeyFwECa/JrGqMqeoRDTE
         OsCEI0XrLkQB7ncthOJfkE3pQLVB2MHhihEKZ15+QXx1RGRgub21xU9FEBJjO+TSWt7K
         2loQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5321tW/hshQn2ZVGYQeWk4+4U8Fw1nPBMgZAScp1+Set9PUqX6+4
	FbAyOgYLTGeyFkf/beIKPKA=
X-Google-Smtp-Source: ABdhPJxXNOx1LLBCeIIco2xLgh5Mhv8D6FXdV5rjdI+d8Qj+7Km2HxSLRV/50mdNGE5BVipAD/ToQQ==
X-Received: by 2002:a05:620a:1085:: with SMTP id g5mr809073qkk.32.1599581458009;
        Tue, 08 Sep 2020 09:10:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:23c3:: with SMTP id r3ls7835124qtr.11.gmail; Tue, 08 Sep
 2020 09:10:57 -0700 (PDT)
X-Received: by 2002:ac8:71cb:: with SMTP id i11mr844845qtp.108.1599581457211;
        Tue, 08 Sep 2020 09:10:57 -0700 (PDT)
Date: Tue, 8 Sep 2020 09:10:56 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cbcf848a-654b-46a7-97b2-bf94caed64ccn@googlegroups.com>
In-Reply-To: <CAGdCPws-hbNUhzANvTyOgWcogiAimRvBTmwOk1rxOnVU5srDqg@mail.gmail.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
 <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
 <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
 <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
 <e0cf2959-7653-4fda-93b5-5abfdd188414@siemens.com>
 <0cf9a640-02d0-4928-873e-08d407bbed17n@googlegroups.com>
 <4fbc4f7c-de79-8bbb-357e-f5a056698f56@siemens.com>
 <14e0bc1b-c52f-492d-aad1-a565969f73f5n@googlegroups.com>
 <CAGdCPws-hbNUhzANvTyOgWcogiAimRvBTmwOk1rxOnVU5srDqg@mail.gmail.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_834_684242953.1599581456398"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_834_684242953.1599581456398
Content-Type: multipart/alternative; 
	boundary="----=_Part_835_960268828.1599581456398"

------=_Part_835_960268828.1599581456398
Content-Type: text/plain; charset="UTF-8"

Hi Jakub!

Thanks for your response!

What do you mean exactly with "first trying to get Jailhouse working in the 
"jailhouse-images system"?
Where can I find such a system?
Can you give me the necessary resources?

Best regards
Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cbcf848a-654b-46a7-97b2-bf94caed64ccn%40googlegroups.com.

------=_Part_835_960268828.1599581456398
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Jakub!</div><div><br></div><div>Thanks for your response!</div><div=
><br></div><div>What do you mean exactly with "first trying to get Jailhous=
e working in the "jailhouse-images system"?</div><div>Where can I find such=
 a system?</div><div>Can you give me the necessary resources?</div><div><br=
></div><div>Best regards</div><div>Jan.<br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cbcf848a-654b-46a7-97b2-bf94caed64ccn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cbcf848a-654b-46a7-97b2-bf94caed64ccn%40googlegroups.co=
m</a>.<br />

------=_Part_835_960268828.1599581456398--

------=_Part_834_684242953.1599581456398--
