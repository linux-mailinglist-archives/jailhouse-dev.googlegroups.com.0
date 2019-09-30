Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB45HZHWAKGQE5KG6WKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B07C262F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:13:56 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id l13sf3367028lji.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569870836; cv=pass;
        d=google.com; s=arc-20160816;
        b=xfJF2+dAn3OxlIAjxI9c+RH/S2/3e61PajwVDyri6r5FcU5WPgpsLf4Jt8dszePUr8
         8ljDWVJV3bIpTyJhcul96H9MvVkEQZ+m4mCbxnNbx0M4ogXfdr8lITrL5CIxie0ovca2
         qW38CTQuAMePYP3rd6btduRPVysfwdA6cC9WLS/8c0B2afFxIjBPjetZR2CyyxmqwM0u
         UvIfIXO69pSA0qZGg5RVXh+r5B1c6pbIUWfxdGdTabUM4iEdeAhaYwwj2Yyc60kK+xZ4
         QNtRNt27Z47/DC6Yrdu7cFY8dhefU7XAShWZYpjoYX2jBSCYEKR+HF4GfgAA4dPIprO9
         wbhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=fcEGY+FawEKV4eDR7YjQN09lW+TvFWcQcpbKI/XjwL0=;
        b=A9wSm9UIgJ/WjriSm1KrHdU5CiSEAFxvCbsJR0y5XXu+k9wwTr1XsOjnF67lWjxPVV
         60IiQCkPNagdtaYcRrM6WNCnfWy+p+/IWO2k+PcSmdCF1ywU47DEl+t7MMRwvy/ihDTE
         bAh9oQ3hhEa3TF4cpBIxrQUJ77wfVUGJ8a/uogfvxctnEcOvKOru7G9wujGexLtSUSlH
         s5XLphfSkSmSOhUrRQCXXFenWX9EgblPzPVwQ/yCLxC9XKuTeTeVGMaXkfS45xZxVtGK
         MEzr2P3wWkOG1t0MdQNheTUYzhPYB1cMg116qZtk1tvFxr9DflLWdnhMJWMGEXjEf2Y0
         zpew==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=erY+hIf+;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fcEGY+FawEKV4eDR7YjQN09lW+TvFWcQcpbKI/XjwL0=;
        b=T43Ofjz9PBq+bb17FuC4Yn+E5OwInt6pip3dci4C2Mx5TF8Ppy6Q+MREu+nAHNRjvw
         WDU4Iqa8qljamQMxFQ4Wne/SlV5Wnse/XNsuXdnAqQkae3THUG3d4AjskFLlsKDhjMv2
         SX/6Zmidq5uXmR7xwfXjr5exGgqQQU+3h4s1NYAWacbiwTzkRCLDYuki8pswtGzafq0r
         nyZYwr0PgUqXGrlT2BlTYGbj6U73X6/Cf1d3aLfRcvpdT3tB05Ob+qa/nxv37hp6ipnq
         MYR/NKRrc5iZD0IWB8B/SVEScX4bOH69NYYtECst2Wuy8MqtJKWm098eN1rxl+imo0xh
         wTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fcEGY+FawEKV4eDR7YjQN09lW+TvFWcQcpbKI/XjwL0=;
        b=r2YBb2iCQ9xHmTte91vhZ6OCT0CGC11PgMGoAr0FYOuSQ97MmaZ7uI6x0jA6MS9TqE
         kGGBNf6ky+fnjCfn5hGj/n7l4DSGNjwaJXpHjFk6sJKGISzFECa5PD/WMJBMkh27XP/p
         RT92ZuI675fopieBfzH5d2CGJNSkX5K/yslBzP92ORKpdsOLMe9BBZh8t9228shPfBwe
         c/iGcghqH3SdAWE0COcYKvmivzLGEih8N8TMNQOgcZZ5iLk1Pj/HuSYrYPxji1uvhOPg
         liTCnWJOlY193HQXkxPPF0TcpO3t624sZHZVRYw3uk7FQMMH08A0q9lc0MtBa1edInfP
         M4tA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVcl/h8r48UILODaCodxOWixSs4qhUKfPWG/cEG5nvLGK99cAG9
	Qbm7tTbaJuKAKBL8YTAZ0js=
X-Google-Smtp-Source: APXvYqyjm5QH/2VDYlUR9qkYoNe4S+zPFCjmQDbFQlYAaPshDkiFl9Bq6EHPYjS0u+8eMT1kXNRYtA==
X-Received: by 2002:ac2:5483:: with SMTP id t3mr12426984lfk.39.1569870836044;
        Mon, 30 Sep 2019 12:13:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:428b:: with SMTP id p133ls1242012lfa.6.gmail; Mon, 30
 Sep 2019 12:13:55 -0700 (PDT)
X-Received: by 2002:ac2:593c:: with SMTP id v28mr11964624lfi.11.1569870835536;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569870835; cv=none;
        d=google.com; s=arc-20160816;
        b=Zpa8jcaxwjJ4Kz0OqF2h4sA7ogLtP2JxR8lcFMXQrpNPFXlanRSyzDxscf0Qo7g/pu
         XPJxQ+91Tt50wx5+JSkg9Plpu6eZwgOe7SUiWlv8I1TqA9J1qj/pMQYeXdQrkm0C1aeu
         GX1N7h9t9hJnK/80hxQV8S1D4zbTzmWZcALkCCpb1rBR/u3koxBjAfC7/OKFLv9sYoLT
         M9pki1cIwFA8LmYPBqDj+N3CYyOPU7G1bAHVF9LQ9Fj0lE3ob+OX/F7vdONi1KyQ50Xw
         MM83H+y984Xk+z3hOvUm2Anvm1erwr/j+PKs3Mw/sexGv13kfqOBe7LkcrKJ7e603aGz
         +6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xe01jQfbLPRZfXVd+5cW5w5kIZ0QbUXsEXvdtiXNti8=;
        b=jvY41E7n7TIUSxZEXWc8F6spnUaVLD7Rzdvxk9K6Yft/hFuqn6dPCAOfcHOgFjhvFi
         g1KkrNl7n+ku6T/X1TpmQ5qj6gZPtlaVWZ+QsLytZn20LvtKLfRLeqXSo7VdsDZqN0hb
         GDJ7eKxKYuqVjk8768ll4Q28k/PaJkPKcOa55QF2llBqMJZ4VWizuLpjzBpaseNqaQIq
         ht3qy4eQsZhjcdou2QtT69AqfM0grIpPcAl6b1nzLnIv2IuiCO/MFZtljoQivVh5LwFl
         hxwwfTHQQCkEM40RFtDB3r5jppMaj0iOAMwbod99lJ67hwwTLmOIlR/WZ+BcAGkul0GH
         aBuQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=erY+hIf+;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id k24si940772lji.3.2019.09.30.12.13.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46hsWk549kzyBs
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:13:54 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:13:54 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <ralf.ramsauer@othr.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 05/14] pyjailhouse: sysfs_parser: simplify statement
Date: Mon, 30 Sep 2019 21:13:13 +0200
Message-ID: <20190930191323.32266-6-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=erY+hIf+;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 464b6a80..b0a9bf44 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -113,7 +113,7 @@ def parse_iomem(pcidevices):
         append_r = True
         # filter the list for MSI-X pages
         for d in pcidevices:
-            if d.msix_address >= r.start and d.msix_address <= r.stop:
+            if r.start <= d.msix_address <= r.stop:
                 if d.msix_address > r.start:
                     head_r = MemRegion(r.start, d.msix_address - 1,
                                        r.typestr, r.comments)
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930191323.32266-6-andrej.utz%40st.oth-regensburg.de.
