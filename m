Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAE5W2PAMGQE6MM3TEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A16771E2
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:06 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id bi41-20020a0565120ea900b004d584f37a04sf4125142lfb.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415745; cv=pass;
        d=google.com; s=arc-20160816;
        b=abpyvuaKV5/735cHJSo4uoNGmsv/MRPsluase33JsnHq8HKa/pUh3gOkHhxNruxE3d
         hLTZ4e0/9HtR5T3sJnI7KPud5DyJklAZL+0rsQgMjU8BNESLkA/ik3gPWYW0APqdS04S
         LdQLtTv9Mm40ctRkBE0YqqKsENz7z8I5yj62mj/zHf0FeIfIJwF0ahkFkO9IDnaRhjOD
         zAjN4vYu3T/XAXX9hFBOWW7sC41k11ErhUJbk+RJLLCiF8QJbbB1+FGJm/ZoLCQPBwou
         qD9GIHyOANLa02FO6cFswu+usS/v6YPyVfsQTsr4oyy5TcVdhLfhOzPeQfNFRwI1ySr1
         k/9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=+Qi6d2DMmDTrKmpVs517QzivKS9JVj1IAuJKmTshg1A=;
        b=gPbWLLPi+eToAF1GanwgWzbizuQ75L+hCDN4cM7me1X5dBWi/Q4beJVXqV+3FipXTI
         TohjWKnKgWPLz9rl9Y7+6mYLdZ4AW3ZB9JNcGg8a942UE96/xJUcxpfoWdM7QUDrOtC5
         NQC16mTGmYH9l04/6MOyAz42RRpTercPitJg+8eMaJLkmK3oyOXxRAXs2CGwG0FlYkou
         uls/JdQmQ345ZA9vfOhjrfUpMkRlnXCKeIQBSfi/qNlI/lGt3R0iWp38WXATHGScBN5K
         TMNlTfVacO+pBwgFzanRe03Pb5bPSlcqKYbggdXl+RcnDlHgEiLpxWH6wpdzMTW/fZBq
         l3JQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=ntQ5C+KX;
       spf=pass (google.com: domain of fm-294854-20230122192902d932375f2eefd4b348-q0e7sz@rts-flowmailer.siemens.com designates 185.136.64.227 as permitted sender) smtp.mailfrom=fm-294854-20230122192902d932375f2eefd4b348-Q0E7Sz@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Qi6d2DMmDTrKmpVs517QzivKS9JVj1IAuJKmTshg1A=;
        b=TETHB5RjZDzNYF12vHbeRsh1gEbVTOr9kTRIf0RlG9Xiw6+tHdQqrEkSxf+UUggF0q
         RiZLtyXpvYaEH0x1h/Vpqva1/i6zyvrxSkR6qzlDZqo7XG71CZWbXxBD6iLzwuin8/YO
         ATNiQ/K7qDFA+emu0t1NuRFcu2mC3ASCJv8UHZBaym+9mr5hUVYgYWvKhOoUx9OmTa6q
         WQXw+5/TcDi1zkXOdHKyRmo4XYi4fO4vuH2mKbmlSpcrBoUMKJF+MqayhQdXrR5GxwXw
         G4pDsISRGrfPsGaetmQUUjqYQmAGsLWCE5RCqLnkAHG6lbVl0QMjkWVYJFtXHRISUOMb
         6tiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Qi6d2DMmDTrKmpVs517QzivKS9JVj1IAuJKmTshg1A=;
        b=EKwpavHoR6HUX6WY0PjPQci2W3mOfEVwGSvIDPSLQ9cui3o8UFhaH95kX9rKX6qDLz
         QxdRkZ7abR3bk2m6U/rgn624fwPugUFgtnkTO+oseNvJ/qUzX7E8Ro1urF4wcIKGO2Fj
         BcZOXM1XkzWpasg4+6YaVkQ8E4SOkNsdppygzmPCyOJl8JD1AaXBHOK9ps6zpmWtMlaJ
         kDaHW0zBomF8H50U2cD/3K6z9xQ4gaamf1RbXPv3hn/4PBYqf7uBEIoaGuKqdtsgFPcj
         QszzYbq6mKIwjTi6MnTEK6zOS4IkiCOCazjIFsEOxV+xanRNG7aPZ/7TWfVN8eMlx/OS
         YH8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krjxejZFPOff6KlZpzzk1P29vVK+CYLvmCg3IpTRgUnQdIsO55E
	V9Mi39Svc532IVB+SAas0tk=
X-Google-Smtp-Source: AMrXdXscL+lx8dxdzDNPz9y0x0fIjsThnk7BJ5FkUBQb0QXmwQX3HQYYV2wG01PCYg/ylWvfoLTZFg==
X-Received: by 2002:a2e:bc82:0:b0:28b:6985:88f9 with SMTP id h2-20020a2ebc82000000b0028b698588f9mr1991055ljf.214.1674415745658;
        Sun, 22 Jan 2023 11:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:83cc:0:b0:27f:b767:aaf6 with SMTP id s12-20020a2e83cc000000b0027fb767aaf6ls1275311ljh.3.-pod-prod-gmail;
 Sun, 22 Jan 2023 11:29:03 -0800 (PST)
X-Received: by 2002:a2e:bc25:0:b0:28b:5391:2ae with SMTP id b37-20020a2ebc25000000b0028b539102aemr7244364ljf.2.1674415743504;
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415743; cv=none;
        d=google.com; s=arc-20160816;
        b=tsqm8DMVp8X0082F+TtLpoeAtVnuOlh1AvMO2M0wuUG09qnWR98+WzwMzaCHDMqT3J
         hZOfJ69SabJilp6QXpg6tmHx+1/UDmILf3X+fnNFLAYNe0wLjNYwIWy+WWen+xcbTc7s
         q8EPaHUKGB6ec3AuqcB4BfFWFzr6ZJdcTMwIL61zt9sLBtA86NMsrGVX2fO0OH5TKIm5
         iSfoUpBl7LIN0LCA7y3ghKCeb+GYvMWRMktZQdilxMstU04WmEVBDKbsuNzhjqn6OSUI
         dXaZluW53mw0CfFfHvA8thYBk/oRbQMoLnPBaNsQST2+v2EMCokSQnmjFrifQK6WyMV3
         Qjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=NxnWI9gPMCLlPoAZQKwPUVU8nON7/KHneI5vSMkcSmQ=;
        b=PEafANCInVQGIbhvD6zFwDcO/QpEMqGhNAGFhldpLDY4M4ZSpSXo2/C7xFgrjiBKXW
         MmwpXij1fuEDhJV1bByqXS5/mR8+FGRswT67jaGaSpgLgw/XA30PB1dv157+fEPyK4Qq
         LD8ZylPe3hGw6tCSkFIsmnSDkWEXUQyAuowciKb8zDqSlZC+J31ypkThnTfitmOvFGe3
         /4VE7UeOl0fBi/fKNIfWHUR5ITMEsRhgkLJUcATiC3bBc8cugHc2GUH1kKJZn0bbZKHY
         ngjsH3W0qXZE3F0QxNQr6QMSf142ql+/tHmNxMQ3iOXUc2yW7VXPfxdcbDnLkiqCnSUU
         9Fgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=ntQ5C+KX;
       spf=pass (google.com: domain of fm-294854-20230122192902d932375f2eefd4b348-q0e7sz@rts-flowmailer.siemens.com designates 185.136.64.227 as permitted sender) smtp.mailfrom=fm-294854-20230122192902d932375f2eefd4b348-Q0E7Sz@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net. [185.136.64.227])
        by gmr-mx.google.com with ESMTPS id i28-20020a2ea37c000000b00279a2f014e6si2020809ljn.0.2023.01.22.11.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192902d932375f2eefd4b348-q0e7sz@rts-flowmailer.siemens.com designates 185.136.64.227 as permitted sender) client-ip=185.136.64.227;
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20230122192902d932375f2eefd4b348
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:02 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 01/14] pyjailhouse: config_parser: Build CPU set from cell configuration
Date: Sun, 22 Jan 2023 20:28:48 +0100
Message-Id: <3c759dbcae3449a2f4e1df52616dda2220ac69fd.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=ntQ5C+KX;       spf=pass
 (google.com: domain of fm-294854-20230122192902d932375f2eefd4b348-q0e7sz@rts-flowmailer.siemens.com
 designates 185.136.64.227 as permitted sender) smtp.mailfrom=fm-294854-20230122192902d932375f2eefd4b348-Q0E7Sz@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Creates a simple set of CPU numbers from the cell configuration. This
will be used by the config checker for exhaustion and overlap checks.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 2a59b651..be0c749e 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -180,8 +180,16 @@ class CellConfig:
             self.name = str(name.decode().strip('\0'))
             self.arch = convert_arch(self.arch)
 
-            mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
-                self.cpu_set_size
+            cpu_set_offs = struct.calcsize(CellConfig._HEADER_FORMAT)
+            mask_array = struct.unpack_from('%dB' % self.cpu_set_size,
+                                            self.data[cpu_set_offs:])
+            self.cpus = set()
+            for n in range(self.cpu_set_size):
+                for bit in range(8):
+                    if mask_array[n] & (1 << bit) != 0:
+                        self.cpus.add(n * 8 + bit)
+
+            mem_region_offs = cpu_set_offs + self.cpu_set_size
             self.memory_regions = []
             for n in range(self.num_memory_regions):
                 self.memory_regions.append(
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3c759dbcae3449a2f4e1df52616dda2220ac69fd.1674415741.git.jan.kiszka%40siemens.com.
