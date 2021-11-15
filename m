Return-Path: <jailhouse-dev+bncBC653PXTYYERBKGMZCGAMGQEGBLYUSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 52349450107
	for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Nov 2021 10:19:38 +0100 (CET)
Received: by mail-qt1-x839.google.com with SMTP id h8-20020a05622a170800b002acc8656e05sf12922246qtk.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 15 Nov 2021 01:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZgjkqGRwNZ5KqPp7fFIIdc5duouhC123bK6U0JXI84U=;
        b=Uv26bGaAAfZ1/AGp63bQof2+dfMOcI00KDwQVgY7hx0ZwXWjL1ICflGXCFrnaVA6m/
         EKF+ef1b55nIUXdO6YcrA5QdKPw5+ZfjLbcbUpazhFKEi6ObhTQYY4Qg7ef5vxzKuU0/
         XEWszz7N/DCnVR6Ju++Dl+SoDTW459W8vMXKxJBopE8+FoTGWMT3D9iRXOmpoLphvl0r
         c+/6aUCfT5N3hbUeIJqpU6yhX3i/eVwKJD4810zZE74lSU3BJ6oyTuG+eHK1he9/TVEr
         VLIRJVnlBQiWXC4YTaTE9xD2hg7ZDtQLgrtY6w/Ao0uEbfbf8Ra8ssWkIcsnvAawIkuu
         WslA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZgjkqGRwNZ5KqPp7fFIIdc5duouhC123bK6U0JXI84U=;
        b=Y0RwVF4Yp6MQW0fWYKoNLr03NZO9N2gfp2i07CkhMD1HuDMoRwiu1MpPEcbRG37pnx
         3lp89ydRHUBulCBCQmjDvFbmSW/xk8df7WFf4NQrAUi5Qc8qWtyLTvtk0yaa04W8LI3z
         9k0m61yvepE5QqpbLN6kLk18dPLNW/t0E8MVFdfgpXFLNf2vafEdVLQEnO9PRwF9toL2
         f+dfGLwEWLxMPlt88kNl6RT1Or01mm+cwSOVLJ49qSvEz/7yQWG5j1VJX5FT19cHoQg7
         vU1qSE1wWGrQJanhs0VeE03PI9o8p8BeuU+uMPkg6ouC70vUd5l7aN9bTHidVLAQroIQ
         oEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ZgjkqGRwNZ5KqPp7fFIIdc5duouhC123bK6U0JXI84U=;
        b=4rTMKlYpmhY9lTqu2WioxbblbsPMRuP45xNl/TmSxbH6R/cI9Opj9NFRSj7nck2WlI
         53uhZ4kpgUTzjbSCE7KT6j38v9m4IURDIlikGr7tN35VJBqaKr3JV6KBsntxjQuCp4zi
         hZw+65RBPLyO1b3NKgGqBn6OKusnFQAN7Mfa7Uj13bNdIedOffER6rlEfZoesL22ELv4
         1NnbeZyPNqE0tQKw3tjR+Q3uM3bNHYckg9QHHASm0H+TBwQ5xaoK05PIGSoj+mSEdKhM
         iumTh7c3u+a9nCus6NrH1P9kyls1G2W+qP0P9aL2R8ov1L2D3va1WOsWZZ/THyBxT0zr
         DG5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5305c+dLvVd5ZRq1+1tUBsruo08fFHN4AH8BKPBou2rizEZiSMR+
	6jiPVk2fPCBlyQ9AlV4kbDM=
X-Google-Smtp-Source: ABdhPJxfbChgycQjXsFcfXo1lLoEDxVPLSBsDTFqJJmTMwcxUh+vR3F7Wky1wMlOmEXmJ6F8ZtBokQ==
X-Received: by 2002:a37:a9c9:: with SMTP id s192mr12208141qke.311.1636967977011;
        Mon, 15 Nov 2021 01:19:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:440e:: with SMTP id v14ls4248394qkp.0.gmail; Mon,
 15 Nov 2021 01:19:36 -0800 (PST)
X-Received: by 2002:a05:620a:14ab:: with SMTP id x11mr28050701qkj.84.1636967976382;
        Mon, 15 Nov 2021 01:19:36 -0800 (PST)
Date: Mon, 15 Nov 2021 01:19:35 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <597c86a9-bba0-43af-bc14-629d483c0bden@googlegroups.com>
In-Reply-To: <69d8e666-daf5-4146-b96e-8a6578ec2cf6n@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
 <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
 <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
 <69d8e666-daf5-4146-b96e-8a6578ec2cf6n@googlegroups.com>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2468_422429462.1636967975887"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_2468_422429462.1636967975887
Content-Type: multipart/alternative; 
	boundary="----=_Part_2469_1197603391.1636967975887"

------=_Part_2469_1197603391.1636967975887
Content-Type: text/plain; charset="UTF-8"

I read an information that CONFIG_PCI_HOST_GENERIC is available from 5.8 
Kernel. I think this would be the reason, why jailhouse fails to add 
virtual PCI devices in 5.4 kernel. I switched back to jailhouse image, and 
will try to build on it as you said. But one more question, 
Why are they missed from 5.10 kernel? is there anything in configuration 
missing?
__get_vm_area_caller
 ioremap_page_range
 __hyp_stub_vectors

Best regards 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/597c86a9-bba0-43af-bc14-629d483c0bden%40googlegroups.com.

------=_Part_2469_1197603391.1636967975887
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I read an information that <span>CONFIG_PCI_HOST_GENERIC is available from =
5.8 Kernel. I think this would be the reason, why jailhouse fails to add vi=
rtual PCI devices in 5.4 kernel. I switched back to jailhouse image, and wi=
ll try to build on it as you said. But one more question, <br>Why are they =
missed from 5.10 kernel? is there anything in configuration missing?<br></s=
pan><div>__get_vm_area_caller</div><div>&nbsp;ioremap_page_range</div><div>=
&nbsp;__hyp_stub_vectors</div><div><br></div><div>Best regards <br></div><d=
iv>Moustafa Noufale<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/597c86a9-bba0-43af-bc14-629d483c0bden%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/597c86a9-bba0-43af-bc14-629d483c0bden%40googlegroups.co=
m</a>.<br />

------=_Part_2469_1197603391.1636967975887--

------=_Part_2468_422429462.1636967975887--
