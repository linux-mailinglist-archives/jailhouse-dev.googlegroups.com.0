Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2VTZHWAKGQEFO4RBOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071CC2646
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:39:23 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id k5sf7007551edx.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:39:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569872362; cv=pass;
        d=google.com; s=arc-20160816;
        b=pLZV3aBsIMcLOidn+pUr7E5fqDvRKm/b5yPW6gRZsGZ9+SXRQZPUGF9C1rQc3/J/Rw
         GpTrbhhn8apnJHuTdisinXKnn2CZ8glOsAByOq/873yApD+QOtXWor/MX6IO3JGBWXbQ
         kBgt43mAtapu/8kGLGR/RHAqTrF/JLY2dRqUVG39z79YSRICcJJGcBIgKH5WX31vs+8b
         yp+jaFLnBzrzk+4nSIDPLBsXsxM4YZZEGnasPZJu+og9H8AnTIPH4aOrJXvWuOKr82Pm
         R5fUu9k05lqdelHBh0T5ZkKyJS7vRFEMVXXGwhQrgvtMWu4ZlVnJ699MWHZxji/HzfMt
         CzsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=v7gBHBfhUQ5aUNzR3X9ycC/ceskfRrIXLbezC6m9LyQ=;
        b=v56bkzPYUUk07s2qaUVLT5lwKab9Vzihk0RXwXumgHzM3S+tumrbXRxP1Xr7FgTrD0
         /aZN2rjgDKBBsaZeFAiplO4v5wMJyf0bWnX31XuQOkpo13BZJwKWU/kNk+IYGJnHSGhh
         bNrNcvjUHLEUIr3xclC0Nsi9IghkwlchGnwIpZjRD/U8+4B4+Nc2cLUj9tt0TrmHVsbY
         1y+L2fbJ4Im0O4C6aU1jOWAJrpLgVPtQRYSa+HZeuWhO4bR4QQHfJPSgPxo0iwLDbUt8
         YG9VeFIxJ+xNpe0fMlCTGhnt8whP+ZN/IC5ExrZrY7PKJ+WlulXlNt1wnMCn9Wkrj/MN
         NzlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=f71915ke;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v7gBHBfhUQ5aUNzR3X9ycC/ceskfRrIXLbezC6m9LyQ=;
        b=APnrRkYK4tRFVHUmarWMyIJFVkqk5GoHImffwSLGSK+KKGuzvh/mHq4vRn7w2zo/X8
         VzEvU4Z0GWhmMqLc1T4l8DjNCSutY/oo0ofzme2ZTPAVhhfRdON2GZtg25zQiXcg/u3+
         pnsejHKnqOpZk9K9cGWshHRrsx1V62KkjTzZlpHCl46qwA917LBnURivL82f2wWcl5qt
         miD0Fxs7xMUEDxSXc8H8rg6qDje69Y4mmxQ0B58zfcldD9l+g4ILGoiL911OiBfvVWhp
         mbp5DzbBP4hcQPimYt2Ns/HwBkEepFYxlXwjtWW8D4mzqwtGZUehMk/o99JKvaz0KjnN
         0eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v7gBHBfhUQ5aUNzR3X9ycC/ceskfRrIXLbezC6m9LyQ=;
        b=t9jRKVgUr/auVsEgN1kp2CWfEcJqvZWV1NgCqrw0Hq/kL+bG0laChKbLEQyYMARGI0
         2mse9JBIA9yznsAv4M65LmSJwu/6iW9d1hpc2WJKWzdZOhRh1DuTgbg2r73yUMnpZItd
         Mq+fGj3wfh+nKfZoinjHrmmpWrPcIGc2o+BjHypV4GzoUNeqHsDuooP32iQlrVIB+dz7
         Bw5t6SPnvhHmpnxGW9K5OKbDCaSO5T7dN5yP6p0Km15V3kBhB9/0ikTzEtiJJuFoeFzF
         bkXXNSkSnhADesHGLyovbSvZgqMW2EYtst8MWOMCAOpz53Qa9eRg9/cXOfJjL/CQ7dC4
         YOzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVphiYkgNQwwrJyJZOMRPT4vBfHQDNaBkNxAErXgoc8wr5FSe+e
	kNJ5mHB7BXvKdPlRASVbSjM=
X-Google-Smtp-Source: APXvYqwyAb1tch5FLjDivtKz0Z49UQLUjc1w2MDyUZCRAnnOzwuk8OPzQ0C7I8AG0RHofCQbVZKXeA==
X-Received: by 2002:a50:9e0a:: with SMTP id z10mr21748859ede.202.1569872362720;
        Mon, 30 Sep 2019 12:39:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ac25:: with SMTP id v34ls2447022edc.10.gmail; Mon, 30
 Sep 2019 12:39:22 -0700 (PDT)
X-Received: by 2002:aa7:c4d0:: with SMTP id p16mr21656550edr.266.1569872362283;
        Mon, 30 Sep 2019 12:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569872362; cv=none;
        d=google.com; s=arc-20160816;
        b=iwWcW49RtZcT8rzz3+LZ2wR8kyPoY6u6ZmI81IodSrRZvJHlvUAP/DJ+xiJOPrjoTy
         TTaY8gDci9FgtmOsSChN79EkwSoSqbKPAQBlYHx1ARl1gfeH+JhMeCuAyzEODxzXdedL
         5NWzihRbMhR+RTq/k8Wjh+7s8V8mXHoRQysS09HTR1Co+iHWjsSI1Ki5UYYExF8/XokA
         wqzmsaD3v0ZqGzkDyzM97sFYqjFAofXQeBl9LwQVoURMIZb5cScLrcjcFkJ6BsYA+coY
         O2nMNYjF59nrJ5cmbzNLpUpug3OXm5D0vY7EITURbYttBm+8L0C4rWg+2t3hrajEj+Jl
         Jy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jKAZKKSralpFFTS72d6N1BgZGq2VFHSmmq1TZ/TuPDM=;
        b=prEz4tHUe8NWcQ9osWHdyWg0+hMJ7Jvxw7sAETq9OI2NeuWL4nWl6SbVQ+9dUgLY73
         bZ8S9Do0R6EE7T1VHsSeRUro9mt4GaaOJf1T9sk466EUU+K4DyUAwggwHa0uxN58YVOt
         39l+8vXv2/AOU+Q6bQ2W+EkUTJCJFneQC+KY7QgaD6BsbidHldVKOmvwDOEdAbF6vOEw
         1LmzTgaaOw4twbjQ7pT50QO83GyMlwMXN44FyxHzXSYaNgs6T09BcWC67ayBW841NmqM
         dLScVUyMs4gQitia+MMmNeNvodYekJ6j6EvQ5ZT5YOII24/w/dmgEir8hnAYRf1LMW9O
         NnCg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=f71915ke;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id r3si998687eds.2.2019.09.30.12.39.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46ht5573Fczy2f
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:39:21 +0200 (CEST)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:39:21 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 13/14] pyjailhouse: sysfs_parser: simplify integer formatting for regions in config template
Date: Mon, 30 Sep 2019 21:38:56 +0200
Message-ID: <20190930193857.2866-5-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=f71915ke;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py   | 11 +++++++++++
 tools/root-cell-config.c.tmpl |  6 +++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 0f91d928..0dcc7475 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -791,6 +791,17 @@ class IORegion:
     def size(self):
         return int(self.stop - self.start)
 
+    def start_str(self):
+        # This method is used in root-cell-config.c.tmpl
+
+        # Python 2 appends a 'L' to hexadecimal format of large integers,
+        # therefore .strip('L') is necessary.
+        return hex(self.start).strip('L')
+
+    def size_str(self):
+        # Comments from start_str() apply here as well.
+        return hex(self.size()).strip('L')
+
 
 class MemRegion(IORegion):
     def __init__(self, start, stop, typestr, comments=None):
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index b6522ce1..d884089a 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -132,9 +132,9 @@ struct {
 		/* ${c} */
 		% endfor
 		{
-			.phys_start = ${hex(r.start).strip('L')},
-			.virt_start = ${hex(r.start).strip('L')},
-			.size = ${hex(r.size()).strip('L')},
+			.phys_start = ${r.start_str()},
+			.virt_start = ${r.start_str()},
+			.size = ${r.size_str()},
 			.flags = ${r.flagstr('\t\t')},
 		},
 		% endfor
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930193857.2866-5-andrej.utz%40st.oth-regensburg.de.
