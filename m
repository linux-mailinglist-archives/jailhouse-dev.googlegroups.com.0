Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBSOX6PXQKGQEZ3E6L2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD5127F88
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Dec 2019 16:42:01 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id b15sf1486816ljp.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Dec 2019 07:42:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576856521; cv=pass;
        d=google.com; s=arc-20160816;
        b=rNEGjxd7I62k5Np/YOfr+U7v1VTdGA7UNabdafQ41qfqzJyCK1mjVnRLimQvgR+ETp
         iIsy5IvUvlArN3vGN/hvfy1JcHcxotQuAYelm5ndexagiRnkkVIOCRH/nHgfZebzmCyO
         g7/d/dU1WjMaCi422zh3hZKFQ8TyVBKdUw/d5vZ/GYmgBtQ2dvYrH3Fa6XsOSHZ4uLGa
         48rl4Y3lbsRX5W/WKN7tAbJn2UH9gowAeDIYqSoRXrM0X/ecCc+Flm53axhs2lj4UldJ
         xRE03PSey1S1LZIQHMayr5RbPBv5zxoTXHQr+zFLLz3XBSO5zbrZWCS98PVBug8AcSP7
         bxCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=V/j1YgJ7E0ohfNKizJ4HN9n26qt+2FsTuIjmEoZPU2k=;
        b=wZoj9uB5CthGsmpbpBwUvu8mObRtKaUOQxElYX/tW3RfiVZ2JKn5vrNfxpiiUJL5Zh
         YhHq1HKsHy4TDLzcZupQmKb9zalSGwA14hoEfAAp1jx3usyKYIau2Au4ik0R0qCpk+F8
         6Y8GCkaBks3NUejruiWQ2krzypC0S8HAjBX06SVkd4eju/uz8D1xCxHsp8SU93OVJpY4
         VbB3TJ5h7x7+Xr/KBhQqJFmw2yXXB0fSnfyjS+QzSEi5IJ8FOXU+W/zAIV1ToTOi8KoS
         qhLNF4t5g4LK0TvJ0JJBXn2Ph0JLoSVpIpErdpWt0sQ7fA/AUjFVyEUTsTnVaA44kOV9
         WNng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=gCT96ua4;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V/j1YgJ7E0ohfNKizJ4HN9n26qt+2FsTuIjmEoZPU2k=;
        b=mWWdxxx75qMPnghJlQYIu6jU6SyWc/b/muFqMYzYhOVz0Uw3WUQpJo0rbA6/LhUoTL
         JcO97NgthKsS2rYd2AZGde2ddKDCH4/LScnN3nJOVkgxUjZkCI9v1Qoko3X6luP7uMjZ
         g9VvGMRANhJaJWtFvjzARKHbYMrE7WYE+l26dBSFmMjbmbEcCGTo2ZK9c38UTkz8XJa/
         7b7Q4NGC/ev+ICQe9QKHuD7TI5GNi7PgbIVtW0D49TlUMlvV30JdgoYhBmMU+iKbja9L
         T5aSDGBULUdiySctxtJTkt23kv89dyVS1Y5kPaCGcLaozD03Wt7hqS9aNdhPzlxYtohe
         kaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=V/j1YgJ7E0ohfNKizJ4HN9n26qt+2FsTuIjmEoZPU2k=;
        b=l2XlF/Mw8JuDXZwhqKu5hVxxJTQIw909jbOsg3EZGU5hRiFcmcGuhBwuikrCfg2R0A
         PD5J2A7T6C5TuzGV83qkPO2oMDoRubO8sbLddmzsCIFmrTQYin3aiLfcsuR7jar0yHNS
         Fs/0z2qY8Llse61442lp1jUJnnLrXKDKhQQOBAEjTr/I7gXajQOBD7VDaAhJiUDHKycn
         I3+5J8Oxxg26D8WMl6XfbpeBzascB2wUOrb4peNY4TFtw4q9pc4vv6vPtrHanhAjJYs2
         Be/9Ao3aSwWe12eBhPlR/zDxvs/Vjt6gb+zvrSI0sN6Yu1sLfifSOt2+aa9yajF664tW
         brCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW7G/fXsFc1tCMwq4q7/LWVBknoKKKdPj8mENdKYpXcB3TSWxaM
	CceCTmAu7Kpnms57RLOtV4M=
X-Google-Smtp-Source: APXvYqyK71N0OvkjQ/4brltt9FyoQC1XUYz/X92dUffwZrxcYwIcZwI4Hbyy2tekFXF2w3cqA+TNFg==
X-Received: by 2002:a2e:94c8:: with SMTP id r8mr9857887ljh.28.1576856521253;
        Fri, 20 Dec 2019 07:42:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5056:: with SMTP id z22ls930223lfj.2.gmail; Fri, 20 Dec
 2019 07:42:00 -0800 (PST)
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr9276281lfp.133.1576856520589;
        Fri, 20 Dec 2019 07:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576856520; cv=none;
        d=google.com; s=arc-20160816;
        b=q7onS/bqbkDaL5H5w6PkCcWJVeiD8eA3E4ravWT4dJGLFRo5t1VwlyHg8Lvh7AYGjr
         5FylyIZgeoKOKLZd8WqDV3CjC6PTQ3EKXD1ZVKs45sH6VqSND1u5WJ+MgRtIAyA3FWbS
         Wh0lLl90/DBSbQ9NpEstzdD/qd/ZhN0JKPR5bvAj0NL55P5JTW+ft41jOOhORqHMvZt7
         X0T4+TjoRaLNrBBk4Iq/Mg6pgU00GCkwgRkJNI9RLcQ+9SAJMztMfHuUKp6h9RYBpIAB
         /cdGGCxhjIsB1MUQQuM9OSsiYQ+DJkzHRa4oO3OnWS10BG0woVy6+E+VYPFRWhYFK0Ud
         hfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=+073BNLYfBn64c5Qj+QVraaB2ZzxII26cjPVCJXg5bU=;
        b=j+sLFFQz+Nfl5BMfBxcuNWmg7H/qBdNqs40+z5GfslEBGp4K1ISQwFrkBs+ysGD+Ts
         xdGGStj6kzfgOjbhxF/kgl5yQvdvPxYKSbmjKY5USZz6n4F0JFJyxio3NLPp9NK9ro0R
         sUdWD451AqLNsITNhhmfmcbWAJgTO3xKGyHIfmKSOcpmnywvs7D33Yxj7l33RHgHksZ/
         jGm3SwaGs8FDTdFtby1LRUGfIw/KHI+qGWwUn0XjiAtFkxYRIsFK7+9cCxiAUhXUehnR
         gyZqMJq5GMqQ4y3W9fW81UfM7QHEPEjj0vnq/ModXf+8FCxo4cfBTtR5BtTxwXOi08IA
         ikcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=gCT96ua4;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id e3si396203ljg.2.2019.12.20.07.42.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Dec 2019 07:42:00 -0800 (PST)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 47fXzq3wzszy4b
	for <jailhouse-dev@googlegroups.com>; Fri, 20 Dec 2019 16:41:59 +0100 (CET)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 20 Dec 2019 16:41:59 +0100
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 1/2] tools: gcov: Fix missing symbol when compiling on newer GCC versions
Date: Fri, 20 Dec 2019 16:41:25 +0100
Message-ID: <20191220154126.1136-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=gCT96ua4;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Starting from GCC 7.1, __gcov_exit is a new symbol expected to be
implemented when using GCOV.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 hypervisor/gcov.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hypervisor/gcov.c b/hypervisor/gcov.c
index 6055bdd5..ec3a0d9e 100644
--- a/hypervisor/gcov.c
+++ b/hypervisor/gcov.c
@@ -35,6 +35,7 @@ void gcov_init(void) {
 
 void __gcov_init(struct gcov_min_info *info);
 void __gcov_merge_add(void *counters, unsigned int n_counters);
+void __gcov_exit(void);
 
 /* just link them all together and leave the head in the header
  * where a processing tool can find it */
@@ -48,3 +49,7 @@ void __gcov_init(struct gcov_min_info *info)
 void __gcov_merge_add(void *counters, unsigned int n_counters)
 {
 }
+
+void __gcov_exit(void)
+{
+}
-- 
2.24.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191220154126.1136-1-andrej.utz%40st.oth-regensburg.de.
