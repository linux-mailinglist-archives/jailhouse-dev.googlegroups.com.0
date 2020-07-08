Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBVHFS34AKGQER7V4YPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8C218660
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jul 2020 13:49:41 +0200 (CEST)
Received: by mail-oi1-x23b.google.com with SMTP id y124sf4472282oig.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jul 2020 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vV9GT0RIIgqCovoBm/DcGrKMmBXfa0b4YZFRo4l3cE0=;
        b=Zwv2B5ff2BoJcssmvTS/Ow6WxguUBckcPAFjYPEMvjuMB669vOtaI6ylu7h5GFqs03
         r/z32uWvNCJ3xZyEfcqP9iQrWkMLs0LDhQIG2IBme4V8PIXhejKPMeHnb0CGhms3dsOO
         EaePf4qH1eyjtk4TC6nGvAYIi5AKVEcTNSLaeYhNOLvI3AbS0nz2yja9aJfpUH2qVOlK
         e2oLp05bBFOUYzo6WNgeln+ycomsPw8sahFLDr7BbC/H3RDABXEk25KTztfShE/c/iJV
         jNdddRysD8A/Ii1A5xHYXvRcmRQ/en6AXPpXEzPPS3X0wRRopCeIxf6V6wUDuvGHfxpt
         222w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vV9GT0RIIgqCovoBm/DcGrKMmBXfa0b4YZFRo4l3cE0=;
        b=MZ6jGjibfF6HSauo+4lw+t51YFFXaQonEI0W+cYwKovjtKjnvw0AzzoSUKKHnNAixv
         s9YYAiAvqF4acE2YqyxlaPR938rZR9SP/budBXC83TRVFFcmviC/EwmUOs1Ya1c5VRbA
         MdsocDp+5TC2zkgeqwfHC25q9M9cuYGaQzvfGQL/BJSfrA0T93DZMpboLtRqXe5WpnsG
         hA2xmYI9eynSkLUJy4vUoS3/vTusjBoKmIAE3cOVS6AHUmzb3zBHCwHSmN0D8af4GvKF
         aH1lsIVUXd8/ZLrH/8gQKDVPS6JuWuSTBwSXrVi+v9Wy0xeYs2ahECMNLjTyht9jFOQ4
         qeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vV9GT0RIIgqCovoBm/DcGrKMmBXfa0b4YZFRo4l3cE0=;
        b=obGssXXIxUHPAmaePqcMe61VqACEJZN2jJ6MCc/C1NWYPG7g8HwB7Y8i4xYjFLw/JG
         ZD6nHVssZkYbCy/w5UN64yrBIMjImX/9aQ2k2syGYS3835PBJ2qr61JYrSfdtBPGHij8
         H/BueldpXMNHHgkIzl+K/6zandu8F3O0SBTwKuorsR+K4dRIWNcHgnsdEulFEitdVFie
         eYoGcphxiXUI6vCRufYttW0dXhYfhQzZL8KVsCYYrPOgPBtNTk79syGevSQYIjLRfGep
         Pa/oT/MICs9qWvaMkn2OfJnytq1ORdAXcrX04yTQ38RfQDpS0kEdcb+0XqVL480GhM43
         GKsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Sx1AFCBxazObzSrS0VIx3yHBVw+/+M9qnxJr+fOvV7okJGC2B
	V9Yc22rmGo+Jdq1hvfe2jw0=
X-Google-Smtp-Source: ABdhPJyCnOmz6uNPC+bgUvPMr1Qx0xWaU7IaRkFKTSC9RJro37GhvLjrz7f2MadWzbYBDa5aCoNjIw==
X-Received: by 2002:a05:6830:1558:: with SMTP id l24mr39469047otp.72.1594208980348;
        Wed, 08 Jul 2020 04:49:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1e4d:: with SMTP id e13ls414664otj.5.gmail; Wed, 08
 Jul 2020 04:49:39 -0700 (PDT)
X-Received: by 2002:a9d:7f8d:: with SMTP id t13mr37850017otp.67.1594208979241;
        Wed, 08 Jul 2020 04:49:39 -0700 (PDT)
Date: Wed, 8 Jul 2020 04:49:38 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <d88a71e3-1269-42f6-93d4-6f66658e5da6o@googlegroups.com>
Subject: License of custom cell configs
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_670_101242474.1594208978583"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_670_101242474.1594208978583
Content-Type: multipart/alternative; 
	boundary="----=_Part_671_916370479.1594208978584"

------=_Part_671_916370479.1594208978584
Content-Type: text/plain; charset="UTF-8"

Hi, 

I want to ask a silly question.

Is there any restrictions on the cell configs source files, including those 
hand crafted and these generated by jailhouse command line tool ?

For a hand crafted configs, may I distributed them with the licenses as I 
wish?

On the other hand for generated configs, I noticed that they have BSD 
headers, so I must comply and following that, right?

BR,

Yang.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d88a71e3-1269-42f6-93d4-6f66658e5da6o%40googlegroups.com.

------=_Part_671_916370479.1594208978584
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br></div><div><br></div><div>I want to ask a sil=
ly question.</div><div><br></div><div>Is there any restrictions on the cell=
 configs source files, including those hand crafted and these generated by =
jailhouse command line tool ?</div><div><br></div><div>For a hand crafted c=
onfigs, may I distributed them with the licenses as I wish?</div><div><br><=
/div><div>On the other hand for generated configs, I noticed that they have=
 BSD headers, so I must comply and following that, right?</div><div><br></d=
iv><div>BR,</div><div><br></div><div>Yang.<br></div><div><br></div><div><br=
></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/d88a71e3-1269-42f6-93d4-6f66658e5da6o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/d88a71e3-1269-42f6-93d4-6f66658e5da6o%40googlegroups.co=
m</a>.<br />

------=_Part_671_916370479.1594208978584--

------=_Part_670_101242474.1594208978583--
