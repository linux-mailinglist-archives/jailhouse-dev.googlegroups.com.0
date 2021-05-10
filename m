Return-Path: <jailhouse-dev+bncBCZ3TK6ASEDBBINW4SCAMGQE3IQMZBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF04378742
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 13:38:10 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id 93-20020adf80e60000b0290106fab45006sf7375455wrl.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 May 2021 04:38:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620646690; cv=pass;
        d=google.com; s=arc-20160816;
        b=rvc2eTECtvdYROHdTmyehowJABZBMUahC7z/w3JM765s2YaGKhe5//Ir7+bzF4m7cr
         D4PdKBrc0NdpQb9R5PN9uq3ePYyst29i1SqwYzvgg6AqPve4zV89trx6wNfFtLShLOsF
         kcovRc8qdl5FInGkjsRKFA7POShQYff2GOZYDdP8MVuL3lvsnbpuN1KGId4T4YgbtYIj
         c5nqem1rjKg2RAGDEn9X8Zmy1MH6xXrTGILi+el9yZzS6iaoPCOumFUIISep+iO6v4VP
         cSklP7jQzwM4u2CNY9jt9LeVMkEdwl1ds0yVT4rhk4gNNGJYJEuqiixyNuQOvpDZAfnW
         rabA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:mime-version
         :message-id:subject:to:from:date:sender:dkim-signature;
        bh=+cxa0ubirpdMcYPbQoNHxbmWjTSR01opejmIUtsMuVs=;
        b=WTMb3ORGzJspMGeBGQuR4v9m64E+VmZRReg0uhTVFuqa0EwGujXB4/BfFK0YrFMund
         O06VTKL8J23EqSsqzNzcP1j83v2OQ3Tjkh62pdkAWvkOmksGYJUxJwXNhsrmS9oWrGzs
         VkxxrPuj+EtcboxIAJfYzfypc52wPDc6x/9IPYd4TR3HXxClIRM/tYR9EsjrpL4tpuw+
         UG3K1eaw0om6HzU+1T6x3OsA6MAUoMajJiO9TdcyFcnf9t1w2I6IYOLUkIX8ZxYlSqnn
         Vc7XJK4nS4HAV3ue2fbz4T5lFYLXFCtXFX/Z6MmQWSzWlqxlKiZq5q6ZsJeD91J/qrjQ
         sf4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:subject:message-id:mime-version
         :content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+cxa0ubirpdMcYPbQoNHxbmWjTSR01opejmIUtsMuVs=;
        b=I8MNsv68Dari2MsD8E0qlJ4VFdR0AdsEhuTxVTC48Ck/noexgstepjS05YLwKsqUA3
         RJmoLiMYlyPpN8MCIOhR3jzHYb0iIUT4yYdQxaw+G94wTZ5RhCs5U2mr8sfo86RDOtQo
         H/dqfYPChbj7+Q25Rq8l7ZWDHetFgXwpFpX0z/+NdVraM1fzzvWluAao8+ckYexuIbx+
         dpEy6C6sPiMKSLcmW0MFyCdkIKyYFU6WmOGc/l6cdhhhe8E+t664qAuc/VW66vxccAcR
         J9bINjQcm/3D0Q3nNHFqWcgJHaHkTMnEuLSCmrLLBBzlq0ZOYPIIkUakKck+gAdumDjQ
         9K8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:subject:message-id
         :mime-version:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+cxa0ubirpdMcYPbQoNHxbmWjTSR01opejmIUtsMuVs=;
        b=jSVpZweTnU4pfXDW0x9MemW5HVgxumT6j1oVeb3o9rBPnsVFVQtUJFX7FGc9SjNnoX
         PoA7VmMWGW6xO5bbxh8dCx1+A9KBwPG2034Q+u2WvdRxquynJNmcd+s8bQONsid5UTMN
         CUWIaUOE50Va2ysIamBFMVsn1WLOGLB54h0QkknXDehtG4dWwdiX02OW1V3G5j0qe1Ia
         Ptteb186JnmdePDm2e4mK9dPYEBjqd8ErYr0tuT3us+ZWqj0/tDTzxPRaQEvt5sDwCMW
         PsQy3y4muDbB4EySxf+7W6u1exHiGCEu12LOEE6YCCQ9lZAGLy5kaaBf7Qtmlh5+Yxwi
         G+hg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533TaSrBBaqXX/GE0nvlv9ZpYcoJDlloygxd1d7LnNWaZ9vZIekD
	DVQY2h/orVOiLLcjlqA7TMA=
X-Google-Smtp-Source: ABdhPJy4TkDDM1a3bTxFBHEL04bwWlS2p+O1+bVFYd/iakTbdee3pcfQiJ887eEROGXyE7cTpB0fGg==
X-Received: by 2002:adf:f2ce:: with SMTP id d14mr24704652wrp.384.1620646689879;
        Mon, 10 May 2021 04:38:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1909:: with SMTP id j9ls9475893wmq.3.canary-gmail;
 Mon, 10 May 2021 04:38:09 -0700 (PDT)
X-Received: by 2002:a7b:c091:: with SMTP id r17mr37672507wmh.85.1620646689003;
        Mon, 10 May 2021 04:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620646689; cv=none;
        d=google.com; s=arc-20160816;
        b=vOQ9MqMimSL/s2mnQQXNhGwo+qf1Cz5WbXejvBzOUOC8crZP+gRbK3iDimp5qnVi2x
         6369PoBOAQ56hlzbB4s0DGzDmKZfUA4Xj3gHhTh6sTvg2wAYvlRkwudv3pPf1v6TKSw0
         jHT0FSEXwAj9RxuLYwbcyh0XIjaIgCsV5lkZUxgtnbPsSSXrOwz9ENQHhGNYohZOezNy
         FPahcwhVNySnAB7AOKWp/lvHvS0UGPn6/RiJrBKhdqdWB7TMUsW534IRysaey4dBxJXy
         yjgWfJPsNaFAWlgkRxMIIH6SQDq6eaSlQKawqTSvkB0c5lAa7YOgU8Zsz/EaWWskpqtF
         VfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:mime-version:message-id:subject:to:from:date;
        bh=aZ2x9RtsIOllZKC6OmES9SZYs/oLQO63GCgkxsJ8jwo=;
        b=IhhPw3jxARprW7Vfc3F4l7eJYq5/bbbcpsdshsCOTT8vHMy5UbfKSDWuTM2ftMRaB0
         ascx1LWHlT1y1cNyyxCaIOuAwhcy++wtLiMurM6ls2bvo1e0bjgfPV1DPEI4wA7CpQJn
         qiBgrhIDWBFzkGj2/q8UTdMZbB0XsQ5MyGUdPpKncbek29jxPfJFN/V+k9ut/jtARabn
         cBYEbdspL9B9WC2QRDXL9DzD6Uys3vpK6hNkg83MB1sBrRPeKSz5u2n5cXTnrHyOmCwn
         kLPeqsYVSpD9Zr09ZblEjy4rlhUjojq0Dzrniuyog/OhaNJlZAN2LFeskm5VJp5l+uHg
         NJug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id t1si711839wrn.4.2021.05.10.04.38.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 May 2021 04:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14ABc8Kt016129
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 10 May 2021 13:38:08 +0200
Received: from hpjp.jpnet ([167.87.33.52])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id 14ABIhE2031691
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <jailhouse-dev@googlegroups.com>; Mon, 10 May 2021 13:18:43 +0200
Received: by hpjp.jpnet (Postfix, from userid 1223)
	id 25159A00AF1; Mon, 10 May 2021 13:18:43 +0200 (CEST)
Date: Mon, 10 May 2021 13:18:43 +0200
From: "Dr. Johann Pfefferl" <johann.pfefferl@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: Bug report: CONFIG_JAILHOUSE_DBGCON configuration as module does not
 compile
Message-ID: <YJkWk7LaSAKG7FwN@hpjp.jpnet>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
X-Original-Sender: johann.pfefferl@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of johann.pfefferl@siemens.com designates 194.138.37.40
 as permitted sender) smtp.mailfrom=johann.pfefferl@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hello,

enabling the jailhouse debug console as a kernel module

CONFIG_JAILHOUSE_DBGCON=m

breaks kernel compile stage.  The error message is related to
"jailhouse_paravirt" which can not be resolved in the module.

When configuring it as compiled in driver

CONFIG_JAILHOUSE_DBGCON=y

the kernel compiles.

The CONFIG_JAILHOUSE_GUEST=y is also set. I do not know if this is
related to the debug console bug.

So either remove the "module" option or fix it.

Hans

-- 
Siemens AG
Corporate Technology
Research & Technology Center
T RDA IOT SES-DE
Room 33.413
Otto-Hahn-Ring 6
81739 Muenchen, Germany
mailto: johann.pfefferl@siemens.com
phone: +49 1520 3450 138
fax:   +49 89 636 33045
_____________________________________________________
SIEMENS AG: Chairman of the Supervisory Board: Jim Hagemann Snabe
Managing Board: Joe Kaeser, Chairman, President and Chief Executive Officer
Roland Busch, Klaus Helmrich, Cedrik Neike, Ralf P. Thomas
Registered offices: Berlin and Munich, Germany
Commercial registries: Berlin Charlottenburg, HRB 12300, Munich, HRB 6684
WEEE-Reg.-No. DE 23691322

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/YJkWk7LaSAKG7FwN%40hpjp.jpnet.
