Return-Path: <jailhouse-dev+bncBAABBW7UT3ZQKGQEOROY2HQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA21802B9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 17:03:40 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id t15sf4148379wro.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 09:03:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583856220; cv=pass;
        d=google.com; s=arc-20160816;
        b=LtgWep7rxsD4vlShdkQxkF3KTT7sDprBLn6PKiOZQUAeJNhfLWbjUgit/+z5JH6sA2
         maCmoec8qTzsyQaBKD9ynOiStowG2nKetKY0pfXbSVF4jnPPur9JhHL04sC0JB53iQgu
         xvZ042pDlWdiUJH+KcMqnnb5UgvIF6i92YIDyMoxUoigZecTZxJMC+VZ7KcQW9yIc3Gp
         crSP685odP0iN69uuw+Zwao2KdnXLL3/bLj3UEqMAxbzTByvptvFxmsNVtEmGlQLqxkP
         5NZh3BL9MGYusJoat5MWyz5vvMwDq7v261oy0n+PWvXh7W43Tfeec2CTw/RX74tAZhMM
         gVSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=k9P4R0QSDNzN1gf6amwSGOjOAKzoJqwQbvw/bgBvpXI=;
        b=yvwd5rsIARRuCu4xdj2wzZ0cZrlCh2+R8Cove5S/NVYWfULsSsxMyLL7htn9fCq+Ck
         PAfAojShdBxOsUHly5UKnrDbDKfdmyDsTJ6LddvP9Ve1SVMUl+OLcKqVUE+R/ag2yT6S
         +9HJRGrIVnnlBb24/vp74c7+Bq4fynQ3en6yXAWt06uRqOuX/YrowZKReUQX7UOr6cfX
         VY5mmpLsMHA9QajSOCnC1675vXJCr1mzjdpXGx/F7EEtPlkZO64/j8+mxD0NVkNHfRjl
         qo8qFv7PCzOusTAyaXxXIWX66qjY2SNOGblA0oO9Dv0xBMcW4BQlDmME+dvZh+x8Mn/b
         9RVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=k9P4R0QSDNzN1gf6amwSGOjOAKzoJqwQbvw/bgBvpXI=;
        b=dqXKDfYwYI4LxhekN0sdpF7nfYIuXTw3yHZnFtJb7jfTI/YYdbg3WiXvtLmGH/AyM6
         E0P5m3PRmIeyTA99YqTEsn97USRltLKAGaJ5C0ttmkgvPGBcP/n3YbiKU1EWIXng81Ij
         f8IguAIC/Nb6P8/Kolbt8eWDUddT/i9uFgCslCp0od53YVOY6vQYXKJvXY7eXefsLxE9
         Dtiy/i7bRyXGUpNRPw2CLgofVLzyOd9KHqwXEPCiqs5rcg9NlPm+StXH/4qyR/dRxWSc
         guSZd/eHwAABzyEjv7YsSB9IswKPlXlbTk9SP5wunhHNAF3OBHE+pxufkCKdVBpn+jqN
         2Y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=k9P4R0QSDNzN1gf6amwSGOjOAKzoJqwQbvw/bgBvpXI=;
        b=puHn96J3+hHqpI9OfxKOpQ+0IiezsoD6yleFC+ua42gsEU2te73Ch1+JDW/UQ/GOaN
         tEaedmMDTJNVGThe8dNrcNCXbQAsMsmZr7cUzoCbIccwV6A29qInlZOwWKrIEQ+/SUdY
         dzlomfrIxF4VWm1CZiTILKYlpBCF9Jt0FLrI/FaDkFNsu9H+llb19QgN3KHz8pDQxDx6
         aXA5RVPu5riV8McNuFZlIByJiPJdpKm4TL2ZBbCz2AecGYRD1a2IbmRdcQpDs0EMwDxE
         6lmoGWNoMtLNy18XuFJGVZvNjLAuHicKEjVbCp8GIIJRFSNsOqx90cLV4tI+YWxO7bKx
         uI5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2okyswSQsKEa1pBJJHkfkwLLyZ85sNpwGxx++91eoyAsYrCghX
	+zIftPEO5VN7X4cdAVRfK18=
X-Google-Smtp-Source: ADFU+vvoUDpH2YeaU3kh0EXEfi+nDfFzNjZp+PnqSmNxISlMH5uyNy7n6v2txWWqWoc0StC/hlUFqw==
X-Received: by 2002:adf:a2d9:: with SMTP id t25mr27612755wra.84.1583856219867;
        Tue, 10 Mar 2020 09:03:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f3ca:: with SMTP id g10ls8132368wrp.11.gmail; Tue, 10
 Mar 2020 09:03:39 -0700 (PDT)
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr29190486wrw.313.1583856218845;
        Tue, 10 Mar 2020 09:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583856218; cv=none;
        d=google.com; s=arc-20160816;
        b=fxsTXvCmjtfRYd+51aYRj+cHhbX/XxYhdYFp6pLkVzI7w7uRxmLjJ+IZq/pF8OYfAB
         P4r9kp811EGTLmSr/8jDvcbQvB9PWAeAgqolDFCYodhZ0PAPVFlY9Y+XyBoUZMJQx0sS
         4a1Glz9e0Va1ZrBnCQJof88GRPzc0qCyvVi25NIm/Jba7JfYb8CMbEHlQQbS1XuN5pQh
         LLKZnGWcMAjFrsbsaPPgeM2ifc9gC+NLj2fKd8/tHk0jqL3tlvX6VWN2EQAXW4GWTgWp
         Gucvhx9ZhTJqEZ1ZDo4DO51SrRtrFTVMpKq2p2eUQ6GN0QpNExQzDep+5QP2ODW6oBv2
         4+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=nQrepqmY0WYuM8ytjEfcgHNINCqDQt+aD+BHS6enVmw=;
        b=WaWMH3PZhvCLyKQ5qtH0hWxmWM2FyFo5NTFYKqpMgEsm6v9c5ObkR8oJzl87hKyPld
         MEJNVPNBEgaU2vMSAwiLq5tf3LlraW5BOfU3QH6l/V8y4mAKdahDkO47XEA60kNHclGx
         guCPWH934uwV5uI5XwbDgLXZfUxGUNvtsNFokWArXlUDizIlDp5fNQWRkkSmB04+DwgR
         np09o/HFrK6bdYUhM0ifbwRscGef1/mcBao7nh5Ka3TaRCGaG/btI8025C3mYLjUS1Lx
         96jJryfqPCNujDzxfpDI9BOhmyuNxyxmaGmUkXO7nTcoCmvquHsetp23G6JZpGwcm4Zw
         zKIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id n3si361716wrs.3.2020.03.10.09.03.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Mar 2020 09:03:38 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of p.rosenberger@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from b2b-130-180-90-162.unitymedia.biz ([130.180.90.162] helo=vulcanus.local.lan)
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80)
	(envelope-from <p.rosenberger@linutronix.de>)
	id 1jBhM2-0006R8-5o
	for jailhouse-dev@googlegroups.com; Tue, 10 Mar 2020 17:03:38 +0100
From: Philipp Rosenberger <p.rosenberger@linutronix.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH] Documentation: use virtio-ivshmem-block for block backend
Date: Tue, 10 Mar 2020 17:03:24 +0100
Message-Id: <20200310160324.21136-1-p.rosenberger@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: p.rosenberger@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of p.rosenberger@linutronix.de
 designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=p.rosenberger@linutronix.de
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

The example for the virtio-ivshmem-block shows virtio-ivshmem-console
not virtio-ivshmem-block as backend.

Signed-off-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
---
 Documentation/inter-cell-communication.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/inter-cell-communication.md b/Documentation/inter-cell-communication.md
index ff99a592..eeed9876 100644
--- a/Documentation/inter-cell-communication.md
+++ b/Documentation/inter-cell-communication.md
@@ -116,7 +116,7 @@ Analogously, you can create a virtio block backend by running
 
 in the root cell. Then start the backend service like this:
 
-    virtio-ivshmem-console /dev/uio2 /path/to/disk.image
+    virtio-ivshmem-block /dev/uio2 /path/to/disk.image
 
 The disk will show up as /dev/vda in the non-root Linux and can be accessed
 normally.
-- 
2.20.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200310160324.21136-1-p.rosenberger%40linutronix.de.
