Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBC4RXD5AKGQEYO7VRII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3a.google.com (mail-qv1-xf3a.google.com [IPv6:2607:f8b0:4864:20::f3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B07258A73
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 10:38:37 +0200 (CEST)
Received: by mail-qv1-xf3a.google.com with SMTP id j13sf437754qvi.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Sep 2020 01:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TSUuX6yQKLPCbzgpBC94NDlCJMcz11FZ5+bM9NcFzTw=;
        b=AxOrr2YRb7v781I64L3gqo5A7OlhqkFLlAM6frcJa+VRbJbikeuNv5fpfxxiNWXEyB
         jAqzEketC1B4ey2117X3gt9oXuh4t/j3eYgvn67/zA9y7ukPnzLvU1FNSpsJbgWx9r2+
         12kZrUB4i/mrRGQPmzl0QCfYestCeyJ/183zjT58bPpMmIG2x4cCAuFuWHAvak82+xRV
         XoxPskgFj1AcqX8yqpJgrpn80PRs2Sa0ZJ7Hs8MWLnNq7XvzzPmV8o2PqG2Fhk31zwg1
         dgOM/KwZykQJlyisdnubTdcyGigUxZUBaXDD9jVVcL/7hpYp1mTRzcO6x4zjusVrK+hT
         fPQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TSUuX6yQKLPCbzgpBC94NDlCJMcz11FZ5+bM9NcFzTw=;
        b=BPqSDeceltMAoNe5lHpkDPdnlIumFNVBaYGprmoy/CrwB9hrIv9DGSToImzXZs596w
         36KFKkScaFZ4dM2mPhV/OqENq833vPK+DBm4hNVMMy8s6OpSIOLKTRWzFIpJY+HiV8hl
         NNVBBjMwn7JfCEL4qE50IMp+nFP8IbBmkIFPvwFwi4VTg3eZWpzmOAEZnYK/cwenxTSL
         tOHn376NXEOV7yfSEDFX7jlYHAkWGTRjT7lmxqAIRisZ8TNMXVzfU9FyvhxR+YC2FSxx
         U5HBI1yHeY+U5lknF1hw7JuP10VRUf3ZYaQRXJYNzLE1w6Rp8xLu++pQvQhV9sjCqJ3f
         NeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TSUuX6yQKLPCbzgpBC94NDlCJMcz11FZ5+bM9NcFzTw=;
        b=gCnm5xPAZ6n+PNyfW8awYSCKkGeXiGFCrSfvghsXNdhbTuyPKBSCzVUfuzR7SK8JcZ
         Y9oXGrokyXDjoTvCaolJeCr2CXBcxgJIEyE2aUfRpT6s1l8tb4NvdXYfzB6BKdUn42cb
         viz4lWhyKneyAk11nqC5fB2aEtm+fqJBsyHJXJ9CF0IXO9lIs1MPmGUXxQxvpdWTWSqG
         pnvFxAV8yU6B2HfeLdI81u6Qkvs358HYdNMIcSMMHTPIxSFrvnTC5cmMTsakTANsekUR
         W7XVOL0Td9T/Ww8KeUVt1Z4hJWO73Xg29+tssVEKidli+2KWDXCEwHoLUm0V35H0Z96e
         WK2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5300iStj9TNNOQSAzfdaDTjdOLSW6Lfd5vXW8koc8giqnXz+nejg
	aeZyPyXDBe2hBwZuZECccww=
X-Google-Smtp-Source: ABdhPJyc766eFPADZvnyrVOBbylj54W1wIJitDGlbwYka+crv1SPAIW9YsVE6mpPFR2QG+7J2MQIlg==
X-Received: by 2002:ac8:37bb:: with SMTP id d56mr632583qtc.222.1598949516131;
        Tue, 01 Sep 2020 01:38:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:33e5:: with SMTP id v92ls217790qtd.11.gmail; Tue, 01 Sep
 2020 01:38:35 -0700 (PDT)
X-Received: by 2002:aed:364a:: with SMTP id e68mr618376qtb.260.1598949515486;
        Tue, 01 Sep 2020 01:38:35 -0700 (PDT)
Date: Tue, 1 Sep 2020 01:38:34 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
In-Reply-To: <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_106_2010732799.1598949514619"
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

------=_Part_106_2010732799.1598949514619
Content-Type: multipart/alternative; 
	boundary="----=_Part_107_1335873295.1598949514619"

------=_Part_107_1335873295.1598949514619
Content-Type: text/plain; charset="UTF-8"

Remarks:

- my system has an "Intel BayTrail SoC" wih 2 cores
- I've added "intel_iommu=on" to the kernel command line
- "dmesg | grep DMAR" brings no result
- option "Intel Virtualization Technology" is enabled in the BIOS
- "cat /proc/cpuinfo | grep vmx" or "grep --color vmx /proc/cpuinfo" brings 
that "vmx" is in the "flags"
- "lscpu" brings "Virtualization: VT-x"



-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0153a372-c0c8-48d7-a595-aa502f81b09bn%40googlegroups.com.

------=_Part_107_1335873295.1598949514619
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Remarks:<br><br><div><div>- my system has an "Intel BayTrail SoC" wih 2 cor=
es<br></div>- I've added "intel_iommu=3Don" to the kernel command line<div>=
- "dmesg | grep DMAR" brings no result<br></div><div></div>- option "Intel =
Virtualization Technology" is enabled in the BIOS</div><div>- "cat /proc/cp=
uinfo | grep vmx" or "grep --color vmx /proc/cpuinfo" brings that "vmx" is =
in the "flags"</div><div>- "lscpu" brings "Virtualization: VT-x"<br></div><=
br><div><br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0153a372-c0c8-48d7-a595-aa502f81b09bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0153a372-c0c8-48d7-a595-aa502f81b09bn%40googlegroups.co=
m</a>.<br />

------=_Part_107_1335873295.1598949514619--

------=_Part_106_2010732799.1598949514619--
