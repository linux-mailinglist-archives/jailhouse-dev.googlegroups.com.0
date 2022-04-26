Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBB6WVUCJQMGQEYM2ZFEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FE151055F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 19:25:15 +0200 (CEST)
Received: by mail-qk1-x73c.google.com with SMTP id bl27-20020a05620a1a9b00b0069994eeb30csf12145866qkb.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 10:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FXd+qihifEVhSLawnFonq+/53jwlAGo1hnn3l8+yBiQ=;
        b=qsY8QBFXaw3rs5mXs2oBRXGv+f2hbvUsm27smuAA7wJe2HrygdTiH2QRUGE4e6JC9H
         FVtYcdLBqPr40d3LfEHVUMKXvpfeGOfo36DYMgAwJQpubeASw+9OhspkGrp1NdrLr4uE
         m9L0XJSjW8ERWzwTQ59v1QdTNSOQAUoe6Qh0tvHhUzmh+be/otIEJCNTX/u2kcQT6kPy
         FbddZJVLtriM3aUieqBpTOktZ15HAHEhl/zlM4guB49e7m+X04yW57nzCDMEDCm8PCcL
         o9GPjtu4SFmcfZWV414OY5CH5eCg/HiRi/YMtd4LFcyG0UhPC8wgNIuY+pdPWQtBIRny
         Otgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FXd+qihifEVhSLawnFonq+/53jwlAGo1hnn3l8+yBiQ=;
        b=XfGHFq6OD+BVLIhSbxwGWcQRqFp0l67l+1dbrYxFEK8xUCVwkUsfuNcfCMmL/uWAvi
         I/SBxE1pzchsZeNXef5y6TwUpYW4yA3KHPrZ3nv2Z3nib3uyTnuZtVYKtyrjDhhOrJhn
         BYxPwmpZDr4oj4Q1oqykbWthAYoB0vPeefyYxJtPeTAZtuchdpC+uabYgGbKWqIwaPYQ
         JQwmS8mQGA9LYMhQVNT4DvYI71WnjNCgz4gEEB8Hqe9yD9ooTKGrG2oNYJpHx6eU0Khd
         X96tlJX6TC9a/W3TEN8Put/QfBO1bJR8GGpErAzqt6649opkoOY+vneFXFt18XCTBPdm
         kxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FXd+qihifEVhSLawnFonq+/53jwlAGo1hnn3l8+yBiQ=;
        b=YsEpfCTdCOJzsJ2XjuIgWkyvISMpATp4r6dx6gF7G8iT7JXw3J/xbEn7QzUcNfj6u+
         rNv24xWTw3FM2Bb6b0BrjN4D5RaK+h32SkRZSPqJVPJXifx32DOWvMeIyVBKiftapejt
         WpYsAPXpKRZChpHzdM/rbmLyava5EIS8lSFQhvzvih2V2cbeuvupMD36lrTUOY5gIsPn
         15CA7UpbX7D4W3ecUUXD8RmtbGt6OFhOrkv/YydtoIBmugKI0vur0TtXvbD0dbfXsh/7
         Bq1Pik3qA69k5hcmAobiHQ5/7z1zNKdlHdlZZXe95+IjTxOGt68nKrJP2VxzhmM+NLCV
         1axg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530upkWYoCUP7ecZmgcxlF25bjt2I5FSMc7PiEX1bjQ+5iEVWY14
	eG+km2Oo+xKgHOTq6V3psro=
X-Google-Smtp-Source: ABdhPJx+qFUQ2LWUaLtga3XsVQVScosxd9zjm+SaVOYGCiaBBYpBzlMzmaFTIEkUMs0UR+3rXWC78A==
X-Received: by 2002:ad4:5a12:0:b0:456:3040:6b0 with SMTP id ei18-20020ad45a12000000b00456304006b0mr10949851qvb.68.1650993914557;
        Tue, 26 Apr 2022 10:25:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:2585:b0:44e:dd77:819e with SMTP id
 fq5-20020a056214258500b0044edd77819els1414103qvb.2.gmail; Tue, 26 Apr 2022
 10:25:13 -0700 (PDT)
X-Received: by 2002:a05:6214:c81:b0:444:1c7e:7b6f with SMTP id r1-20020a0562140c8100b004441c7e7b6fmr16956741qvr.48.1650993913747;
        Tue, 26 Apr 2022 10:25:13 -0700 (PDT)
Date: Tue, 26 Apr 2022 10:25:13 -0700 (PDT)
From: "vsun...@gmail.com" <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fd90fac9-bb12-4839-b659-c417b236e04an@googlegroups.com>
Subject: imx8: could load 2nd linux in console but not getting how to get
 the shell up in display screen
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_78_1687059504.1650993913275"
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

------=_Part_78_1687059504.1650993913275
Content-Type: multipart/alternative; 
	boundary="----=_Part_79_1193023565.1650993913275"

------=_Part_79_1193023565.1650993913275
Content-Type: text/plain; charset="UTF-8"

Hi,

I could load custom image in emmc & that boot up successfully via jailhouse 
non-root cell in console. Root cell image shell getting displayed on hdmi 
but not getting how to display 2nd linux shell on imx8mq. How to achieve 
this or any other way for display?  

Thanks & Regards,
Vipul Kumar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fd90fac9-bb12-4839-b659-c417b236e04an%40googlegroups.com.

------=_Part_79_1193023565.1650993913275
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div><div>I could load custom image in emmc &amp; t=
hat boot up successfully via jailhouse non-root cell in console. Root cell =
image shell getting displayed on hdmi but not getting how to display 2nd li=
nux shell on imx8mq. How to achieve this or any other way for display? &nbs=
p;<br></div><div><br></div><div>Thanks &amp; Regards,</div><div>Vipul Kumar=
</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fd90fac9-bb12-4839-b659-c417b236e04an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fd90fac9-bb12-4839-b659-c417b236e04an%40googlegroups.co=
m</a>.<br />

------=_Part_79_1193023565.1650993913275--

------=_Part_78_1687059504.1650993913275--
