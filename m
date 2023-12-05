Return-Path: <jailhouse-dev+bncBAABB2XRXKVQMGQESPHCLJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-f190.google.com (mail-pl1-f190.google.com [209.85.214.190])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD480496F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Dec 2023 06:45:16 +0100 (CET)
Received: by mail-pl1-f190.google.com with SMTP id d9443c01a7336-1d08383e566sf25690135ad.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Dec 2023 21:45:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701755115; cv=pass;
        d=google.com; s=arc-20160816;
        b=qNvgy92URqcuzGi71bH9YKh8cWjwwsU77rKck0f2vRS33IUTKeFogZ3KWq6IR+bXgo
         PpwiyTE23cVIhOdsIWOt46mufKznt8Ms0bTpSvmeEjylxGARvvNhTS1Rd30JZ8IeW0Se
         7MsFjztZ46Yn7Ua90jTBeZlz3dymLt09fxYOrJMeKQF003HleTq6uC4jB3rwZVNSiCVw
         qcUGGSEjzV8wp6fvDCJCRwge/TxseMPfEjfp0ckWbc27a72bYDJEy8qS+iP3uE5QANYd
         3agNWjrFtvtXhfTu8GRt34z8uiXgsu/LxBRX/4ICfH2Q6gwtGvMEaFXq7KZeN4VtgGTC
         Gm2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:from:subject:sensitivity:sender
         :message-id:to:mime-version:date;
        bh=yXe2li32RbIjdkollAfQtXQDpKQVNi0TelDw1+1shCU=;
        fh=Ba7lZS4RxWO8X2KTGQQ1rHuHRQwkvAz/WNY5HL7oBtc=;
        b=IAEqo0N8Vhylhq1qrd41aXoFsjabclE05zwP8mFIvHoj1TOQQXkPcXP2f0bN26bL2L
         9LLJ9NRw0Idb20r/u56QmTtZPo/nG5rttW0wzUslUjJGy1MXsmmML1dSNsuZnzqAH1uY
         kXWCT6q7cbF9aPzVCTwKs0zmUTm8M0RWgBB+gaVROIaBbOmLObrP2jucCn10mQquLqTM
         5H5s2d3bg9MQ0nECak6UiNPQzAo/pw3uKUhgDXOlYveTcv8WOW+UstV6wAiVUwU8P/st
         X4IPvzdvrRfGTgMqdJhdJiit2BFDV+IMMn+kER/RQwHGb25gw6aq70Uy8FTSoJN8Sb6+
         FEnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@rediffmailpro.com header.s=epro header.b=czmyQjDp;
       spf=neutral (google.com: 119.252.152.43 is neither permitted nor denied by best guess record for domain of myinfo@hpfc.net.in) smtp.mailfrom=myinfo@hpfc.net.in
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701755115; x=1702359915;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:from:subject
         :sensitivity:sender:message-id:to:mime-version:date:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXe2li32RbIjdkollAfQtXQDpKQVNi0TelDw1+1shCU=;
        b=ZOn/ZbByATVBYh+/AgxktHbqtsm+s85WJoM/a7GHjPYwdknzA4iKuWIlIHYwI+uOdY
         2y0+1oant93KanNzLDMo8J+JMHN7ifQOhoM9vppAXLNK1iSkDfv+oKerfXNnzmCSlMI4
         cIVCnW08FfJNek/Bsn/MAnTXFbzsO+wbHcl6H9R10Z5bxyJ89DY+gSWMpApZhG+JhGcv
         EjqkCBtKW0hccSGqq0/lWhsEwVUj1udSao4iw1ujuql9YzlXorl72FxyFYvybgPed2rV
         dKb1uq1e5ArRSipmh/JdCn5xDokBZQVNTzrSCXVob7JG/Qxp2SYc8zFFrF+s/WTX5rBk
         23dg==
X-Gm-Message-State: AOJu0YyU6Twe5RZnywoETwbIzCM+9+gUjYfFt7sUfaTAa5C4252ZS/rk
	n7HM21UPiU1DrGFWieZ/T4Y=
X-Google-Smtp-Source: AGHT+IGrft4+NOph4qEsvjZhA4GTxzWhYdEIQWOVsBjha5xcULr7fbJerlChXl++ufEieS38oyF7fA==
X-Received: by 2002:a17:902:d2c5:b0:1d0:b24b:bc32 with SMTP id n5-20020a170902d2c500b001d0b24bbc32mr2156754plc.120.1701755115004;
        Mon, 04 Dec 2023 21:45:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:6b01:b0:1cf:6501:291b with SMTP id
 o1-20020a1709026b0100b001cf6501291bls3260743plk.2.-pod-prod-03-us; Mon, 04
 Dec 2023 21:45:13 -0800 (PST)
X-Received: by 2002:a17:902:f545:b0:1d0:9a64:e511 with SMTP id h5-20020a170902f54500b001d09a64e511mr3340617plf.73.1701755113546;
        Mon, 04 Dec 2023 21:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701755113; cv=none;
        d=google.com; s=arc-20160816;
        b=ClIwcc9ZeDMWq93aGqyuYlZHb8JJfH5I39uszO9dEH+zD5ZcNMGqgXtIylPxXMlw2D
         0hh7KlNKTwfDfWGdOezjI0E2uWsVkBLKNxj42MeZ+nvwUZPdvWauMcF5ta2x1L+cXH32
         afC4RJJBEFFe0awHJkAlSMxSEnM8ujYlNOjPkZiKOGfGVf1fIbnOu6m89JL5XuUj2Vby
         XBxkaQT4PquN8k8VaLapaOH78SeCMzZJNc7GtgHWKI9DyoufRq4pCdjFohyodJguxFfG
         vi5GvXOWQQy/yugKQwq7FJwxvx2cUJe9IVcdhmnurLXS70yHdYIgt8D1ukLlnhWOZGgF
         ABDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:subject:sensitivity:sender:message-id:to:mime-version:date
         :dkim-signature;
        bh=7H5cmj4pQ3kPBH1jGi5pGG/JBqtYjPUlA8vOmnSGjY0=;
        fh=Ba7lZS4RxWO8X2KTGQQ1rHuHRQwkvAz/WNY5HL7oBtc=;
        b=CgQUxSZ1JtC0fXTDFDioaI2xlEkt6QfRQld9V9i55rDW9upsNbevbZFk9h+XKoyadh
         v6/yYrj1sQJ243CnP3LrTZtYghKkqArgjx2qtKg2l7POPpWtBHwfcGmZCZQtjdfinT/i
         jADguaY5T6ymKq2riDt+EzqOo02V5zrvZoJOQ92EURoLkh4Y7LSQtdoMT8wZu5C/ZwDr
         Ijj41XXt3bNSgex9JdZlIPO7E4ygIMbJtQ6r6aPf9RLLOwewMQyP/YuFpTYEIVRR0ed7
         qQsKklFlnEr7fB7semT2ctIobLPFBze5pRD5FFWl5s2f6XLETMrjm5wYxNychlIE7pVv
         AvNw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@rediffmailpro.com header.s=epro header.b=czmyQjDp;
       spf=neutral (google.com: 119.252.152.43 is neither permitted nor denied by best guess record for domain of myinfo@hpfc.net.in) smtp.mailfrom=myinfo@hpfc.net.in
Received: from pro152-51.mxout.rediffmailpro.com (pro152-43.mxout.rediffmailpro.com. [119.252.152.43])
        by gmr-mx.google.com with ESMTPS id jg21-20020a17090326d500b001b816e24eabsi265466plb.4.2023.12.04.21.45.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Dec 2023 21:45:13 -0800 (PST)
Received-SPF: neutral (google.com: 119.252.152.43 is neither permitted nor denied by best guess record for domain of myinfo@hpfc.net.in) client-ip=119.252.152.43;
Received: from pro-230-133.rediffmailpro.com (unknown [10.50.252.5])
	by pro152-51.mxout.rediffmailpro.com (Postfix) with ESMTP id 54F701E0D8D
	for <jailhouse-dev@googlegroups.com>; Tue,  5 Dec 2023 11:15:08 +0530 (IST)
X-REDIFF-Delivered-Remotely-To: jailhouse-dev@googlegroups.com
Received: (qmail 2131 invoked by uid 510); 5 Dec 2023 05:45:10 -0000
x-m-msg: 74322b011702526669f6872007df07aa; a6da7d6asas6dasd77; 5dad65ad5sd;
X-OUT-VDRT-SpamState: 1\SPAM
X-OUT-VDRT-SpamScore: 500
X-OUT-VDRT-SpamCause: "gggruggvucftvghtrhhoucdtuddrgedvkedrudejjedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecutffgfffkhffhnecuuegrihhlohhuthemuceftddtnecuogfuphgrmhfkphdqohhuthculdehtddtmdenucfjughrpeffggfvkfhsuffhtgesrgdtreertddtjeenucfhrhhomhepfdhinhhfohdrrggumhhinhdfuceomhihihhnfhhosehhphhftgdrnhgvthdrihhnqeenucggtffrrghtthgvrhhnpeefgfegkefhgffhtddufffhueeigeffjeeffeevkedvueefleeggeduhefgtdeludenucffohhmrghinhepihhmqdgtrhgvrghtohhrrdgtohhmnecukfhppedukedurddvudegrdduieejrddvhedunecuufhprghmkfhppedukedurddvudegrdduieejrddvhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhihihhnfhhosehhphhftgdrnhgvthdrihhnpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhinhhugidqshhpugigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhikhhpvghlihhnuhigsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthgrnhesshhvghgrlhhisgdrohhrghdprhgtphhtthhopehlvghgohhushgsqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtohepshhtrghrsghluhgvsehushgvrhhsrdhsohhurhgtvghfohhrghgvrdhnvgh
 tpdhmohguvgepshhmthhpohhuth"
X-Dedup-Identifier: 1701755110_2123_2121_pro-230-133
Date: 5 Dec 2023 05:45:10 -0000
MIME-Version: 1.0
To: <yotam.gi@gmail.com>, <jhs@mojatatu.com>, <pmeerw@pmeerw.net>,
  <castet.matthieu@free.fr>, <stf_xl@wp.pl>, <siglesias@igalia.com>,
  <jens.taprogge@taprogge.org>, <industrypack-devel@lists.sourceforge.net>,
  <harveyhuntnexus@gmail.com>, <dmitry.kasatkin@gmail.com>,
  <adaplas@gmail.com>, <cezary.rojewski@intel.com>,
  <liam.r.girdwood@linux.intel.com>, <yang.jie@linux.intel.com>,
  <qipeng.zha@intel.com>, <jani.nikula@linux.intel.com>,
  <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
  <intel-gfx@lists.freedesktop.org>, <jesse.brandeburg@intel.com>,
  <anthony.l.nguyen@intel.com>, <intel-wired-lan@lists.osuosl.org>,
  <mbroemme@libmpq.org>, <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
  <intel-gvt-dev@lists.freedesktop.org>, <alex.hung@canonical.com>,
  <jacob.jun.pan@linux.intel.com>, <yong.zhi@intel.com>,
  <bingbu.cao@intel.com>, <dsaxena@plexity.net>,
  <anitha.chrisanthus@intel.com>, <edmund.j.dea@intel.com>,
  <declan.murphy@intel.com>, <sujith.thomas@intel.com>,
  <irenic.rajneesh@gmail.com>, <david.e.box@intel.com>,
  <stas.yakovlev@gmail.com>, <faisal.latif@intel.com>,
  <shiraz.saleem@intel.com>, <rajneesh.bhardwaj@linux.intel.com>,
  <acelan.kao@canonical.com>, <maurice.ma@intel.com>, <ning.sun@intel.com>,
  <tboot-devel@lists.sourceforge.net>, <linux-sgx@vger.kernel.org>,
  <djakov@kernel.org>, <jmaneyrol@invensense.com>, <io-uring@vger.kernel.org>,
  <horms@verge.net.au>, <ja@ssi.bg>, <lvs-devel@vger.kernel.org>,
  <cleech@redhat.com>, <open-iscsi@googlegroups.com>, <konrad@kernel.org>,
  <mgurtovoy@nvidia.com>, <isdn@linux-pingi.de>,
  <isdn4linux@listserv.isdn4linux.de>, <tvboxspy@gmail.com>,
  <jailhouse-dev@googlegroups.com>, <cooldavid@cooldavid.org>,
  <mikhail.ulyanov@cogentembedded.com>, <ryabinin.a.a@gmail.com>,
  <glider@google.com>, <andreyknvl@gmail.com>, <dvyukov@google.com>,
  <kasan-dev@googlegroups.com>, <masahiroy@kernel.org>,
  <linux-kbuild@vger.kernel.org>, <dyoung@redhat.com>, <vgoyal@redhat.com>,
  <kexec@lists.infradead.org>, <raven@themaw.net>, <autofs@vger.kernel.org>,
  <kernel-janitors@vger.kernel.org>, <chuck.lever@oracle.com>,
  <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
  <julien.thierry.kdev@gmail.com>, <kvmarm@lists.cs.columbia.edu>,
  <chenhuacai@kernel.org>, <aleksandar.qemu.devel@gmail.com>,
  <paulus@ozlabs.org>, <kvm-ppc@vger.kernel.org>, <wanpengli@tencent.com>,
  <jmattson@google.com>, <jejb@linux.ibm.com>, <stefani@seibold.net>,
  <jason.wessel@windriver.com>, <kgdb-bugreport@lists.sourceforge.net>,
  <anil.s.keshavamurthy@intel.com>, <dsahern@kernel.org>,
  <lmb@cloudflare.com>, <me@tobin.cc>, <tycho@tycho.pizza>,
  <starblue@users.sourceforge.net>, <legousb-devel@lists.sourceforge.net>,
  <matan@svgalib.org>, <mikpelinux@gmail.com>, <linux-spdx@vger.kernel.org>
Received: from unknown 181.214.167.251 by rediffmailpro.com via HTTP; 05 Dec
 2023 05:45:10 -0000
Message-ID: <20231205111510.1701755110.1948@pro-230-133>
Sender: myinfo@hpfc.net.in
Sensitivity: Normal
Subject: =?utf-8?B?QWN0aW9uIFJlcXVpcmVk?=
From: "info.admin" <myinfo@hpfc.net.in>
Content-Type: multipart/alternative;
 boundary="=_77d068e86d425792ac4aebc68305ec32"
X-Original-Sender: myinfo@hpfc.net.in
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@rediffmailpro.com header.s=epro header.b=czmyQjDp;
       spf=neutral (google.com: 119.252.152.43 is neither permitted nor denied
 by best guess record for domain of myinfo@hpfc.net.in) smtp.mailfrom=myinfo@hpfc.net.in
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

--=_77d068e86d425792ac4aebc68305ec32
Content-Type: text/plain; charset="UTF-8"


Dear User,

&nbsp;
The Classic version of Ionos will be replaced by our new version on the 6th of December 2023. So it&#39;s time to upgrade, before you lose your email access.
&nbsp;
Sign in
&nbsp;
Note: &nbsp;Please do not ignore this email to avoid your account being closed.
Thanks for choosing Ionos
&nbsp;

Ionos account team

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20231205111510.1701755110.1948%40pro-230-133.

--=_77d068e86d425792ac4aebc68305ec32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

<br />Dear User,<br /><br />&nbsp;<br />The Classic version of Ionos will b=
e replaced by our new version on the 6th of December 2023. So it&#39;s time=
 to upgrade, before you lose your email access.<br />&nbsp;<br /><a href=3D=
"http://www.im-creator.com/free/admininfo/admininfo">Sign in</a><br />&nbsp=
;<br />Note: &nbsp;Please do not ignore this email to avoid your account be=
ing closed.<br />Thanks for choosing Ionos<br />&nbsp;<br /><br />Ionos acc=
ount team

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/20231205111510.1701755110.1948%40pro-230-133?utm_m=
edium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailho=
use-dev/20231205111510.1701755110.1948%40pro-230-133</a>.<br />

--=_77d068e86d425792ac4aebc68305ec32--
