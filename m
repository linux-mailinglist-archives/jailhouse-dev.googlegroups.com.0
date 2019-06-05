Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBOOE37TQKGQE5GZLHLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1A736067
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Jun 2019 17:39:38 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id t62sf830wmt.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Jun 2019 08:39:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559749177; cv=pass;
        d=google.com; s=arc-20160816;
        b=OeGO75LRi/yg9gGwZ71pg0WQdD1zH6NFT0tC1tZpXUpfFmjn/pAisalzc7l9WgseE+
         T6RzI+CHviP9oGn1kdhPg9m9qBvdJkFc9PcLfPEM00OFEOTxx/f/v7MWQEF/sOkMX27d
         sTacYqrr90aTWOFcAPpXPnRsYsN58dJ79ZEV9K+e8To+5guSsgF1IPVj0d9dgt8f8YwC
         nWkbi6b2YbEhIGFblMQvrR/wbwEr+3b00/89gr4paY+9hQDPA1cAJhXwOnl/Q1eNqy3W
         wq+0PWbYp1u1zCRjNeO6N0CIrSxgEpd5UbyeEJ1gei7sA5M7kBJqv/oqSTbukZdAu7SY
         rqyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=yRvKsJwiWucmOBco/qhcGGyNmLq6OBlSyYMGJbonfow=;
        b=YeMjticQA9pmzsbgKCenRL1ACvaplPT8uHGctdiZjU3oU/BQD9HDnvnmyeickj0ejD
         +Pepak5shtLI/vn3f9mH85ZQ1169fLJ38eZVG6XgFRfrzeV+amK4XrnMxcOK+nLWY66e
         DdL8T31s66Hx5U8re2lnOUCux8nTgH7PTvi5Vk5qAHT83lxXnjJTDfnRD+GSpaPxIeXx
         MvfSNKt9IIbSQCaxo8tsmK9oFcy51e8/txEVXWREmUEoMCU0ihTORSae4wbySme0VBOe
         AkFWAU41/50jMiXAZjA2eR2BQW9NNZLLioyWWEMowGV0ik2uiCQJfi5XrS5oNXIqbohT
         h64w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yRvKsJwiWucmOBco/qhcGGyNmLq6OBlSyYMGJbonfow=;
        b=ecsVzW64OCAuaKuKSgK1DX7U5QRNwsC+3MOYNUWFsVB7jMO5m2jnr4QA4n1o3NO107
         JUCI8eNSPCna1kC6N4VyL+Urfz7m7uyel76hqRGFThG5ngRfsEHY+Akpvcjy7AzPLD8+
         PWI2VYiw8ThYdWeKuWV6sOW0nQkJHHxV5PsY7HeLIL474L+fXOsdeZzmrPmk6o0LZqMK
         OqIOBKs9e+lQ7qWqTIHu5T/xq+c0MGAiXUj0CZOh4AL+/3bZsQKwLOLbiYtkDxA8Y8a3
         2SrlLtbP92WBxsytXsS/G+8uZRW1CJA0dtwfwomN1HMsi2J9OCx9C/NMYfrHqNL8pf34
         g5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yRvKsJwiWucmOBco/qhcGGyNmLq6OBlSyYMGJbonfow=;
        b=YTATI6Nlm6vx2cUgI1lEtJ7uKtknuCVvRsnWIooS51o6ntMZaxWeUeavYCkKUr4Ts5
         kfMI1USeLWWgmhajYD1lqJRxxafQ2aNH5ln7lbEI8xsAOuKBIIxOOPUWYHO3eAOMh4Nr
         eEJ7hxuCMCPMvEsKwziMP46qYy6l6JlR2LT8C33DKvegyXyAwHYDwnd4WNy9W4NTvrxG
         8fWu52jQ8z8CpEUZoIGadSHQE4XJR8PvpbnaFX3gPTUSsqsB4qbuP9UAuGsfdoSF1kId
         5iZ7/07ELHg4p9CV/jz0J3zaABiyII0x0JErEsTpXKAs/3UkZ4Q+gVC31R8RAYmxjV91
         s4ww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVcBmaSvHRp0uojKNtCfOe4B/AK/jPlDaxttvdTVbwPV+jKXK6A
	sUZtGjSbjrMAp4HGIedkkkg=
X-Google-Smtp-Source: APXvYqyrB84OzwF66n3U4YK4xvdRsMPtkPl5wHHR0HwCoB2aMpyi3rsHj+3Zmq9CbP1D6OxeJ0rKfA==
X-Received: by 2002:a1c:e702:: with SMTP id e2mr23094228wmh.38.1559749177722;
        Wed, 05 Jun 2019 08:39:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2944:: with SMTP id p65ls846869wmp.4.gmail; Wed, 05 Jun
 2019 08:39:36 -0700 (PDT)
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr23656550wme.177.1559749176950;
        Wed, 05 Jun 2019 08:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559749176; cv=none;
        d=google.com; s=arc-20160816;
        b=mzR3o6VvAG+eMetaq9Md/FJhqEO+RsvABi/N0B50O6V41iXKLfOGDoanw9bDRWvepO
         4PBVVRox0WoJiGu8p4AkPFiwpN5S/DL65DY5TwZUFdy1PZMhYcbkR+yYuaLxQ1ISB+EV
         caUOeuhmoCv93Zhghz62dE0CEG/R+dPOvLbXDI1qEPN/NICnOscOXrZvKAQkVLPQhpDR
         0Tc+/U/A1xasqdEj8ABIlSakOvReOJ//BSdvS0j0rnyhnRv7C1scYo/Oyzg6teVhXOXM
         M0QoAEBa5zYDH/+VcBXjTBp0fDWS1jRHVB0jqWy8GiGVheE/AOrfn005iW5rgD9XUdve
         dBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=2eVSO5Zua+WKQjJBtgluZqTppg/jN1tIEl8H1HTrjag=;
        b=arz2eb8xX918wUFHoYaiSgwhDLhUg6MKvT0AXbZZXj2bdokGi5A+ScPYFJLtE5jmQt
         ydvMTs+ggH0VkTAywrDabj5M2E+40y6FlJBo4PPGtuLX6NtLHMCYk57DBQEZWg7ms8HF
         q4yPqZAuEC5pSNfuJSOFPxpiT5FRTNURPij1QJaLgmtcNKrkB6voHYZD7FHRCJ4+vJfn
         LJ1TMtDvN/NpYWjAgkij/VKMopOO3WB7MhOgGPxyWa3rDkuLYh9A8JSm8bGiRbpOXoCU
         y1zKQ4U/4qznrwA+HHlnPJBeOWUuJWlG0PHe0M8g064LfJgKxxNWqXEEDIfrTmQ3oQPQ
         K4gg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id b9si757805wrj.2.2019.06.05.08.39.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 08:39:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from localhost.localdomain (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45JtJS38Gpzy18;
	Wed,  5 Jun 2019 17:39:36 +0200 (CEST)
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>,
	Jan Kiszka <jan.kiszka@web.de>
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
	Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
Subject: [PATCH] pyjailhouse: sysfs_parser: fix IVDM memory region definition
Date: Wed,  5 Jun 2019 17:39:00 +0200
Message-Id: <20190605153900.32177-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.5.153316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.5.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_1099 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RCVD_LOCALHOST_LOCALDOMAIN 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of andrej.utz@st.oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Content-Type: text/plain; charset="UTF-8"
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

Second parameter to MemRegion must be its end (inclusive).

Fixes: 5fe206927c05 ("tools: Implement ACPI IVRS table parser")
Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index fa32ba48..83222c4a 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -481,7 +481,10 @@ def parse_ivrs(pcidevices, ioapics):
                       'regions. The memory at 0x%x will be mapped accessible '
                       'to all devices.' % mem_addr)
 
-            regions.append(MemRegion(mem_addr, mem_len, 'ACPI IVRS', comment))
+            regions.append(
+                MemRegion(mem_addr, mem_addr + mem_len - 1, 'ACPI IVRS', 
+                    comment))
+
         elif type == 0x40:
             raise RuntimeError(
                 'You board uses IVRS Rev. 2 feature Jailhouse doesn\'t '
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190605153900.32177-1-andrej.utz%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
