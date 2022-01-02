Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKVGY2HAMGQEDRPO5OA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EAA482AFF
	for <lists+jailhouse-dev@lfdr.de>; Sun,  2 Jan 2022 12:57:30 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dsf17817344edc.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jan 2022 03:57:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641124650; cv=pass;
        d=google.com; s=arc-20160816;
        b=Sb5UbRDTA/i/noSXOmd0O3nqUah9vc6Jiejw+TlqE/kSwdZc4ANRCPRc1AbF3qwwYI
         bxF3fakXmqaAOx49hMZ/1qQH09A2q2P5AlBR6eZ/UK/sJ/XCXPKEQr8Dx6pxg1opAM/x
         B6VeVXGRmI99b4Lm0o1MMEfY57eF8Zx0gvl6b0DdnBBC+jQjVyb7r/Y3s2Ceaul2vp4Z
         TE4GFQ/sp90FLptc4tP2JWWsT6PmRX/XN6qYvL6HdZ/dnr5OqMwrxEXU1IKtmK4Cz9im
         2wlJwNweMcjcpNC+tvslG02aWzzZ2VkAxBRradiG43QMTlU9oazX1wwnfKZUBaPzSTPO
         GTkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=uNd1SHLjcwX1lRvS0nL1uxsxvSSCq5oCBRfUwIl8P0Y=;
        b=i2OlVBjp1ySm0GsFVGmZAA+rqWmzioLUsasHENu4QnAm8scHObDlKAIP0kk3FlPUN7
         iV1UfnQofWidR7mM1NVhydtiQmlXyDVORkpC/5fZ8/iBvj9hkRL+VGgWxGKiaJXT8BvI
         1WeDTe5AjzJlWos59TTJuh5+H6M+a4qDci3GgykqlJuzq5lRQqR/oBTXbSsKts+sYQE2
         d9TrkI8e7/hPnyPOd42mTn9cemBx+XA736TEDE2Tre0CVxnHiR7zWgihMYrQ3sVz2mW5
         T3tQ6uKYK0AVOr5zYCciJ8RdUgkHK80VTOGrIMhwU8WfQAGuIhAaA5usg+nv3WIMs38G
         JGSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MyNVgNSc;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:from:subject
         :content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uNd1SHLjcwX1lRvS0nL1uxsxvSSCq5oCBRfUwIl8P0Y=;
        b=sTrnPcehmyCSuY3BNxEPp90rl/bigFODbJhFp5DU+066f5XoFCMLr3o3Fy0chJ/hqE
         tM+z4+p6Qbj4jpGaHZSKyeZjs2OBFQwnfOaMjADTjma+zFrX7EJDDFqqKF9kbVW8EW/b
         KN21VQ14TTnIgWHdctzszDyRHMM09eGgpjQsHyp93pqZ5hlb0BzwdoE9ANhth3U4YfEb
         Rkt4Na+j2pimV0Bcdf4bUyg5szUUay2PuiDcTtvy7ZZWgU3lh2p3pzoPCkbGHraY2A5o
         cOalI2DSH44mjh6ggMxBmApnWcQsblTBmgWhqq5nFDEVRVoL7D71Cimq/NXI8qho6Yzz
         dyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :from:subject:content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uNd1SHLjcwX1lRvS0nL1uxsxvSSCq5oCBRfUwIl8P0Y=;
        b=Y3talX9R8ksNJILSWxVAaeFJhPxBXCExyYkaEYfU/7Qavk3vL4d3z8EdGqgBpDncLi
         7I0qgdy79JGx9P9afyCredgAaghS7vtBd0NnoTvl3G517DRQP9l+J412Qk6XPo8rSk/N
         F0edIiY2cdi2icfqsUq76nvUZoUBuSg48JvrAioJiKQXDTvUZg9DULTBYscFnunXOWdm
         OoUQQfW1eBV5s2N2D0nPDtrM0c9IiNglnD2u5I3tEGvk9W7cPt3mGQSHWMX+OiuMdeHJ
         Wk1/XWx5hDsXY4a697HChoOEiBAqkZ67Q1aKDUHya/fM7EBQS+MXzXVLlZ+Ck4b3zq2f
         JyhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531tq2hwJqx6hzM4b92vbAa4IRYk1i84K+Pu5s9IPAcB47aBNrRh
	01s+aFOkzXIYAkfz+AVAcoY=
X-Google-Smtp-Source: ABdhPJzwFrbgs2vFlIytOEWqcC/8wTgehoXuHE0aoZR2ZxRtPldsrUtO1rhHHt9C1cqlwq2MgZQ/2w==
X-Received: by 2002:a50:d710:: with SMTP id t16mr41329577edi.50.1641124650439;
        Sun, 02 Jan 2022 03:57:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d56:: with SMTP id dz22ls2411417edb.0.gmail; Sun,
 02 Jan 2022 03:57:29 -0800 (PST)
X-Received: by 2002:a05:6402:c0a:: with SMTP id co10mr41310284edb.295.1641124649513;
        Sun, 02 Jan 2022 03:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641124649; cv=none;
        d=google.com; s=arc-20160816;
        b=oGVX9hT6wcRdtIT/eSkQK9M5wlgvrNX/82CHX38GDYQyHq65UM45y+EEbqn8E9O7oC
         lEJXh1deZfTCh8hRnoMg9CMiOA3WAEzPSs9WXuCPLrHkPIMkaGMDs+aiRimTp/JrbZy6
         P6fE043AQP0q5T6lRj+HtaegFyShm1EFYsJbkt2/fEZS4q+SX7H9MSN+grgaJ3keQ9hV
         A06inG0k61xYPQ3g1qn/UE8IGdcY7/DPViAXk5CtH0fQPEOkr/14KRSCOY80WEGm8RAh
         2vKXQgaYt4rGF1JNnkQ6JUMTDMgCHZclkbuAZHZ9g+tNS9F5Vr+mEityIpHIjlrYPq7d
         jInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q0KVExZjivvLov95wvxtwAEpIcPRdXJeM1G2dWjgc5o=;
        b=avKLvQYF5oKczCp4V5f77q3VWKJexNmRgmRfNHu4kJ5vg6pAd+mxLD8qQ9sobpnC4g
         MIap55nho3heEkd+vNsrQILW/eA/yoq5TJEyA/KmCNCLYJZ++wRjILe/CjXl7IIt//JQ
         xFd1+gkJljcLnrj6EzDPdck3TEmon56wOPQUVCABCilvAov+diyWsfRKsQmfoemVa9Vh
         4DtTSyNWgxvRYF2FeytOg+RB8ys/5m7PgRA0iAHJIQxP0DR8FqcNBOO9CjdY/x+zh5lE
         26FX9sf0vG7Nyrf/eY6kYKMyF+rgUVmb/Dtv037l1ic/OZmvuYF/5Yja/vAd06TjRUhd
         SXJQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MyNVgNSc;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id n1si997044ejx.0.2022.01.02.03.57.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 03:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N79RG-1mKr7F01KW-017O75 for
 <jailhouse-dev@googlegroups.com>; Sun, 02 Jan 2022 12:57:29 +0100
Message-ID: <dd4819ed-9b00-7e2b-3d02-acbc25f1e1c4@web.de>
Date: Sun, 2 Jan 2022 12:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] core, inmates: Add own stdarg.h
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:rlKVk506CykW9KLHrXfBoUQIxTHQ9CE0LXeLXMNs0GfSgMvTNPL
 qhcaQVBRrIqUiqKJvpxiKVdytMat3pSBA2eSH3cm9OfXpCGgj/QEKcpeCMr/rY9xpCzYOwr
 Cy/7/z3xHmfZe6To/9MZRlqFbRKS37OAEr1ZjgR/V19OoPlCN8QywHFX/mWkcKWW6y4MJiE
 lvnedoDMnr7IB6Cf2uxtg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JMKaTW0y590=:8Cx93UoyJ+CssGdF3mAC+i
 agshfTZRqy8WqrUsZp0OoejtZuRQYe5HuQzf7kcrqgCBjPOF9Cbp1C+TOJ0E8IvJnV/bYaQ0H
 +mPZAo2Kg3+CvcIc8uueRBZDImgfx20IYUW8fq8ThIicggh1HyU8VNNkqEoqQgnCUXNWGUBIO
 Qy4p6qz5gHb6dfFI1+11FxzceDqvsXbkEns/kxGxOk53/hiBPYIBLBiHW0Ii2pZe+OaV2/m2Q
 DQu01LTPQiaCAPKfVNvIPyuow/NbztxqsLXnFSJZchrjdVv+lWQ+fSCkatFugnoWpSnHzO/Lf
 OzwMBoC3UAoz6bZJzaAIoNw/jLTq67O1u0iJFFvpeIL3tHuFMTT26N9NRFNwGbXrlXv/gFC90
 Qgf8XV1sDssduiqWSIXmaBT+zAKGuOivabwsnJcK/P7nbl//9647mZRtPLPUhLq5M3rginGM1
 T8WukA5V/oeFaoYK1S+Gx+d5rGUFLzn63AXFig43vx5A3ZJj/9FrkHYNviM8EkA/J0JCJfabG
 AJ+w+pKu14Zq5pXLN+I06spqg1pbUHlwkT5In46b4gqpH1wdJ/zQvMFHcMU4rOuATsAS/M+wm
 er3Y1JHRzHhe5K/G76ipz/c/7n5H5t4aus96d8inRSf6OPTXhW0nYXbuUgEh6Pe5OT7Up2eUx
 M7DqMawLFRbg5bo03uiUezYQK0RaMsrLmbzbMzWMGVnP8xfnB+MY9PF+rO7NSuVuIqxOjlXK6
 rR+DFOEvOigIIWb2JenySBAzIGxyPl+jjNU2zB1bl1yL/Db+wl3vIQyvHUqYRK+tk+2PDaD1s
 +A/PqlfsdLemzHt4FqK9/7lQGVewHKWhWVnMzqgDvfxYzx6imPOyo4H2O+nX35ZdP91je6f3L
 iA9lW9AxWIq9EZLLdEZftUL06VySe8RQVwRudpSkIo/B3j3nmyj4eklwheF7WtwoBzXhgsprg
 FCqzqK+nvdjJ4wdE1sXHIdZColRFYXlKXgR1nWQRzdld9OdaHXdv9EiXqgdFPjzWa/WdLQgn9
 lhVZZsurLcOxScxOdwsxzYyG2mub0S3FFP6OtJElXF2nvm/AI1hyJN0Fn7LWtZRIGBtG5tJxA
 rhlXOzu5Hwoa+I=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=MyNVgNSc;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

The kernel stops using the system headers with 5.16, and so should we.
Just add two simple headers that map va_* to __builtin_va_*.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/include/jailhouse/stdarg.h | 17 +++++++++++
 hypervisor/printk.c                   |  4 +--
 inmates/lib/include/stdarg.h          | 43 +++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 hypervisor/include/jailhouse/stdarg.h
 create mode 100644 inmates/lib/include/stdarg.h

diff --git a/hypervisor/include/jailhouse/stdarg.h b/hypervisor/include/jailhouse/stdarg.h
new file mode 100644
index 00000000..7c8633d4
--- /dev/null
+++ b/hypervisor/include/jailhouse/stdarg.h
@@ -0,0 +1,17 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2022
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+typedef __builtin_va_list va_list;
+
+#define va_start(ap, last)	__builtin_va_start(ap, last)
+#define va_arg(ap, type)	__builtin_va_arg(ap, type)
+#define va_end(ap)		__builtin_va_end(ap)
diff --git a/hypervisor/printk.c b/hypervisor/printk.c
index 1b3027ba..d2ca6eb2 100644
--- a/hypervisor/printk.c
+++ b/hypervisor/printk.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2019
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -10,10 +10,10 @@
  * the COPYING file in the top-level directory.
  */

-#include <stdarg.h>
 #include <jailhouse/control.h>
 #include <jailhouse/printk.h>
 #include <jailhouse/processor.h>
+#include <jailhouse/stdarg.h>
 #include <jailhouse/string.h>
 #include <asm/spinlock.h>

diff --git a/inmates/lib/include/stdarg.h b/inmates/lib/include/stdarg.h
new file mode 100644
index 00000000..21e58850
--- /dev/null
+++ b/inmates/lib/include/stdarg.h
@@ -0,0 +1,43 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2022
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+typedef __builtin_va_list va_list;
+
+#define va_start(ap, last)	__builtin_va_start(ap, last)
+#define va_arg(ap, type)	__builtin_va_arg(ap, type)
+#define va_end(ap)		__builtin_va_end(ap)
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dd4819ed-9b00-7e2b-3d02-acbc25f1e1c4%40web.de.
