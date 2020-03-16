Return-Path: <jailhouse-dev+bncBDSMF24UTUGRBHNQX7ZQKGQEVVRDPWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 66850187398
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Mar 2020 20:48:47 +0100 (CET)
Received: by mail-oi1-x240.google.com with SMTP id i22sf1800738oii.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Mar 2020 12:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SfoKLCcxEv/lwTAbA2A+b2PxbHMP1R/Bvvv8h78yx0E=;
        b=Jdvnb8RmMi/wqrO4pDhG8qSy5Dhe7iOFArgrHTjz/1VRwBkRfDUOSBtcvLCW6gaufb
         WeGyL1+ClwktaJtz6ZeQJnBpG1CCjWEA9HjLDOFGgDOCx+pJuXgozF6t7aq0K9HpqWR+
         lHdZJ1fOCbUgzPFJGQ+gtjNzEJNWB0nfEOiFroxBhYLw9P9COXhTY8Pfi7pgybFCsdHU
         VE6sqHJRj7sSoc4NaHTpvRVkyfDi8jO+pxCwkaeuA+rB76l8HgGMkrmtQ1AiGReVmf1e
         3/hpD6fg0M+JbL2z/zTuyrvjuRBMfNlgCJVhATC+F0M2xG2sXsMhrGacsD13PQIvtR5Z
         9Wpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SfoKLCcxEv/lwTAbA2A+b2PxbHMP1R/Bvvv8h78yx0E=;
        b=NRlYwEduodtUp3ZVlsXhvasSNUImb4Sf/EmsBpEZIQa4FMvtTTI3cvDIa+SGfoiToh
         aKEdixtrAkilNhtw+wf5nj7kROOaVGuLj3Bmb7MlhXSwhPvhEGyArOmDX8cX1qIcQoKA
         nYR2RxqLkfj9b3i3QZzzTl/Hxy7377wmal6bQcauBjHaq6S/wms1nYVzVc9MAOAvEsBi
         ePc3SdjTo/HfT8l1ebHwxgSWBjDvttMGHo1POO2J8kx8oFmSSuUDDgEdR+ruA0SpKxn4
         lcBfFLep0K/Gg7XB17gxhhnamCmaKzCGzlHIx1ywVn3XRPssxmUg5/fIstqhctYFc6je
         VvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SfoKLCcxEv/lwTAbA2A+b2PxbHMP1R/Bvvv8h78yx0E=;
        b=XDViSYNvHo/Xe96x8050w9fk6BlMS0hSLg4dt0FAXFsRJFQaygJHXNUE0V2qMh2+yj
         oNIewszzkIplWSATkgsVjjBjiBKim4i6UG/8DGxKxaUhglrqzhYe2KS5TN2z4U0nR1r+
         j3mWJjhMoskikwCHVrt4JDjftgkVWFUQBE0FNXLobJJcZx64FTpGcpmo8OuVpj+MzO3h
         HVQWu2g6IabqXwExyBuUEC9vkub28kJ+U3ic3J2WxS0kcMprEkxTlepf1LU0QeI42RGg
         0B2QEDoy9XbjvBGMDCJ+Wg95wNb14aI2PSnE7i4Qc5xb67AO4SroDWUTtw+feRUnt8bL
         FbPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2+1r6fsxeGQgYhU9sg3WZlUQexoYZ1r6hrzdr07SQVJPazsKuM
	jqLABUn+Xw3nuq87p7pKLfk=
X-Google-Smtp-Source: ADFU+vvKag3Vm+U3OwRCPI6SvdWbpsbzlFo2FkXHZNx6xl9s9B2mxT+Hm4xqa2Shn2nwb2cf87mMTA==
X-Received: by 2002:a9d:708a:: with SMTP id l10mr793646otj.152.1584388126125;
        Mon, 16 Mar 2020 12:48:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:b98a:: with SMTP id j132ls4900520oif.3.gmail; Mon, 16
 Mar 2020 12:48:45 -0700 (PDT)
X-Received: by 2002:a05:6808:5c7:: with SMTP id d7mr901605oij.136.1584388125302;
        Mon, 16 Mar 2020 12:48:45 -0700 (PDT)
Date: Mon, 16 Mar 2020 12:48:44 -0700 (PDT)
From: Parth Dode <dodecoder@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2384177c-4f87-473f-aa91-c054325438e5@googlegroups.com>
Subject: Initial build error, help
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1734_2044066420.1584388124695"
X-Original-Sender: dodecoder@gmail.com
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

------=_Part_1734_2044066420.1584388124695
Content-Type: multipart/alternative; 
	boundary="----=_Part_1735_1942424859.1584388124695"

------=_Part_1735_1942424859.1584388124695
Content-Type: text/plain; charset="UTF-8"

I cloned the repo . 
I want to build for Raspi 4 , 1 GB variant.
When I ran the " build-image.sh"
I get the following error which I do not understand:

sed: -e expression #1, char 22: unterminated `s' command

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2384177c-4f87-473f-aa91-c054325438e5%40googlegroups.com.

------=_Part_1735_1942424859.1584388124695
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I cloned the repo .=C2=A0<div>I want to build for Raspi 4 =
, 1 GB variant.</div><div>When I ran the &quot; build-image.sh&quot;</div><=
div>I get the following error which I do not understand:</div><div><br></di=
v><div><div>sed: -e expression #1, char 22: unterminated `s&#39; command</d=
iv></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2384177c-4f87-473f-aa91-c054325438e5%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/2384177c-4f87-473f-aa91-c054325438e5%40googlegroups.com<=
/a>.<br />

------=_Part_1735_1942424859.1584388124695--

------=_Part_1734_2044066420.1584388124695--
