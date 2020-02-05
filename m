Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWEG5LYQKGQEU4ACEOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFCE1527D8
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 09:56:57 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id b15sf135034ljp.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Feb 2020 00:56:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580893017; cv=pass;
        d=google.com; s=arc-20160816;
        b=vKf1JXhbJqv8LCSmnW5I+ScAvTzEIEHX8ucyxiPB9OX45XQnqkOpKc2v5lQaWA1dNU
         hL4HDObMBcXf/FF9x5bJNL/zwQsIeleYhWvSVOX6U0u2vt/xIdPvp0J38cH03a3myOlf
         KEovUQEnMtvRRnC7cEsS7GP3xcEsslLJEL/ZVhEuvSUr8sUiaOaCjeNK9Y2DDqp44L3P
         Ji8QFA3VdjnhL/7gCzAanHT577WRMigPIh7hrbQjCsxZRXKNk8a41L7hooQfsh9pR2w4
         94xbLv8ZaW8MW2lHC/ztsqaOpUJ9eoj7v4hbZpxoFrvt0ATrZAzvui0Q0F1wERd/vfCQ
         33Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=1EGcrsL6++mMXj1UuJIwB3AV5GCrHaavPXKMHpuHn/U=;
        b=BdQC9T9ad4kDd7MlrCymb+u3zSx3UkQmCeYrClR/dAJWJyguj2j/hoksoqkGX2KC0t
         tjP6eF7f7joFBfDqWZtod3R2GY6pq4OVwVtD95se6dShVzvd4iQpVKX7sV5EX2SQjMhK
         0OmoC/E60NI3FFI+NuWJvXupTG2RktiL1B9QBYndB41hI/SScN06X7kVY6/mQWiISaHe
         iWAHAQ7IuaZSdN1y08qOavkbcoPo2UW3uL0poMCJIVVsqjW5hkfoKNDVnMFzXgqh2mTr
         s3W1ZVjTud7/Hs+Pc547hKvHtcPxmpywwqad88/uor0Xav63WyJLoLoO8EpbRX19b5T9
         4Jwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1EGcrsL6++mMXj1UuJIwB3AV5GCrHaavPXKMHpuHn/U=;
        b=p36xNI7mPGR8t8obfkJKCiO6chZFQ4BhtzhH7df7tdjiS/xUWZn3PxkFA9FoFO3nzh
         TfcDin/TNiBbAGy/HEc+VYJqpU9rkQ3M2Wmxc4um9vBquETKlG2FOxLs2qJ6x7X1fwBx
         ebSlQe6XnwjugJTAm216wPO8vVuiySLJBX2gvsbnFD3BjMxyBDjZCQ+niEajBY+AgZr7
         zwQA3Qd7y16isPzRSxJCzjg8E0JtlDNsevT3lQLJinB6NgewXM7IEsOaDFRjizQ7Dhjp
         zdfM8Kn3O7IeU+XYacyF15HLMCsCQKuPvg4v1OONrkMTwjEe28We5VcCtwDOl5YmmkJW
         duYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1EGcrsL6++mMXj1UuJIwB3AV5GCrHaavPXKMHpuHn/U=;
        b=VBtYsVBcsAG8/YNHOojc2Ryeqa6Koi3d/RraxnIv9nPomJAxr59ogHEl4XkbLRolmN
         y+oVPCTXvzqawFNOaCDnlWlmeq5lMQC5o7VjaEUwc0KpS7ppUNQOfmytEbelDjyKaC5M
         oYOiHpShO9p+tuVZ5H6z/3jBHow5Ie4S7YCR/xj25VmocWQHhHTduUrr3ijqtdsA6DG8
         7w95UgJcKwdOj29iYzLg66meWKB+/ASN45sPO1QseSqs8sVUn5d4BQ2TDuHOIbVwBlGv
         t2wkWiPuwbo6lIHSd/u+Suq5AqqSwMtmsjYXeboe7J0FSkuoQOopHh/hUumKhHo5ucYv
         kNTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXABKsSK2p4rRdRMHP4VpQJSExM2fyl4uWMoI8Md/gXL6vur5Ai
	GCSP1A4BPTHCcnRwshulNhE=
X-Google-Smtp-Source: APXvYqw+LCQy4EXgLVQBEPAKVhxW0emzv7uWPpFT0q35LpWpBkZ93eRy0WILV2iuzfM4KCcK08oovw==
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr19697497ljc.246.1580893016258;
        Wed, 05 Feb 2020 00:56:56 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c397:: with SMTP id t145ls169998lff.10.gmail; Wed, 05
 Feb 2020 00:56:55 -0800 (PST)
X-Received: by 2002:ac2:5310:: with SMTP id c16mr17339686lfh.102.1580893015329;
        Wed, 05 Feb 2020 00:56:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580893015; cv=none;
        d=google.com; s=arc-20160816;
        b=jZ7zB7bLw3mIroTVwdPu+MKuVvNX7dHVUeN6qSbCKkuIoR5uOFaNIwha4xeXjmoH0r
         fGUSf5SuNywDFNETxmZbwFxv/YswhN8Ta3/VM0IRM3kvbyh4YB7rSeVlSkrgizvUb3AQ
         Se/Zg3HGE1WXCTQGePTrAgUEVXUVYSUdUPc3YBW3YwrARL4/vqfYNKSJaSml29HHgLXz
         PiRVOVm8Qc+fLJS/wOLVqt2lh881yElZVTFKlnOIVvbJJVWKNxnaL3meClOGRK9w+bZd
         oOxj4gL2PruxTJV5DSRRstuqx59045n4s0RjzGg3ILLbdQpuagaCofbVx1I8pSLDtkTO
         yNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=sBSWEKxU36B9yqPxnWrypVTZkJRE8XxrApAlqa0i5T8=;
        b=M8+bykRsPYdiw1InJUAjEY98Q3nvL9jBH0dk7Ih+HFdXd/v3Rgps0xfwHNnFDlz+zh
         bUGFSuzHhcZGl5Bj90fjj4Z0apzXs9IN30CV9ia4DEP0P1sbAqzD2kAUODsr2GDcgqlH
         Zk5ueFMV8UcpjCZvnYBz+1Ar+oryW6hoK7l/XlRqtDUog5sJpUYnXqIYdmxhknMBOcV8
         EOeeJuyP4PxKI+4REgj7G4jZ2y12Vcx+FebmSD9MHfc3Z9+UMw/pPEJE+NEwvQwllz/S
         tv0JX1MfR4Xraajd34xkicYFMPxHXFm6oOv9QhdZzj+WPqKledw8PcElbpu6UTlEsbaT
         Cl8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id p12si1370274lji.1.2020.02.05.00.56.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 00:56:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0158usfv016668
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:54 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.54.219])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0158up0r006156
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:54 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 7/7] Update README
Date: Wed,  5 Feb 2020 09:56:51 +0100
Message-Id: <9e57d07c806a4e80ddd0913d894c1c54bb9223fe.1580893011.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Refresh some dependency versions and add a note on the ESPRESSObin that
it requires a newer, self-installed firmware for XHCI suppport.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index ea3fb03..8841513 100644
--- a/README.md
+++ b/README.md
@@ -12,10 +12,11 @@ Quickstart for Virtual Targets
 
 The host-side requirements are:
 
-- Docker (tested with 17.09.1-ce)
-- QEMU >= 2.8 for x86 image, >= 2.12 for ARM64 image
-- Kernel >= 4.4 with KVM support (for x86 image)
-- On Intel, kvm_intel module loaded with parameter `nested=1`
+- Docker (tested with 19.03.5-ce)
+- QEMU >= 3.1
+- Kernel >= 4.4 with KVM support (for qemu-x86 image)
+- kvm_intel module loaded with parameter `nested=1` (for qemu-x86 image on
+  kernel < 4.20)
 
 To build a target image, just run `build-images.sh` and select one (or
 both) of the QEMU targets. The generated image can then be executed using
@@ -75,6 +76,10 @@ command line:
 After that, the board will automatically start from the generated SD card
 image.
 
+Note that XHCI is no longer working with the combination of pre-built vendor
+U-Boot 2017.03-armada-17.10 and kernel 5.4. The kernel suggests to update the
+firmware. This involves manual building and flashing a more recent version.
+
 ### MACCHIATObin
 
 The [MACCHIATObin](http://macchiatobin.net/compare/) is supported in both
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9e57d07c806a4e80ddd0913d894c1c54bb9223fe.1580893011.git.jan.kiszka%40siemens.com.
