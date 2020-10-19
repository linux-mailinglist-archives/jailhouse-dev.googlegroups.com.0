Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBENSWX6AKGQED4Q575Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B8292476
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Oct 2020 11:14:57 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id y20sf2932095lff.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Oct 2020 02:14:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603098897; cv=pass;
        d=google.com; s=arc-20160816;
        b=N8uf1D/JTsoth/KS+55lDLrBYr4ZbZsk8lEGmeZbCuP+7iMN3W12QNAmnpEvqUIwQ8
         bqYyFzLhl72mxuUlPGmSPnex/anG8etyiLI+T6ytKO0vwiIyWVeR6IbvQAbsm+ayR9Xh
         Lge5TdhG+Dj2XeYo2vczucexP1BbVpFI+DLqTcjSh4vx2u6Zkhk3lGHBQ0cfyvQyXXxi
         qWc09CzGDasqJZEMKOyEvhyhF1g09nC7m7of0ftRl5rj3zUVeZr53RXWpPpAxKjohea/
         I0d4eiWxxLklYiyovVGjsTuJyGAmb1hBH01T78Oa63QGQ+TIc8m9jx4RlWCar5eMKSUH
         E87Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=Lu82jetjKZoOQOEPC3jvQJYlz51BzRE5OKDzPPaws0c=;
        b=zybkQLeaTXunkBDtWG8nNITbut6L1iUk2s9FmZh/b7iY3vikkVshDAijyW2CLVqW94
         Qki0S8SQDqyMIrdsvyAQk8DctmOE7bqi7rxfr2VA0+2ZX0MSPK7VF1h0/eY8GgdAHIDL
         qIqVltFtS4h/z9qhuCTNI8Nq26TZ99aI5pINXL8S5YJMTPKo3tAoje+J5o9xqk/JxDik
         8pXjUd+cXmpWFWe05tIWjfYXkx7Nu+buDfBwt6KUasaPTyeK8wFOycHFhlaU3OczMkRk
         FWC80ckc0TYfHGHJ0kSwO8rFlE1tNjQBFyOFOxgtLFnggiquvgLgzWeqLJJRsdwFhFfv
         c56w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Lu82jetjKZoOQOEPC3jvQJYlz51BzRE5OKDzPPaws0c=;
        b=LTRXcqIOwuf2gAMRU2+IjVm6kHfH/0oEqULosKj+pJ3kjdpf4ODxIZ7Vm7d8fwwA2u
         NQWddm/V1e66i1ZDM3q0QHGcSJPET7cgjUd4PM1D/4CuxAiJgRCktqrjwMOWfSVZkOsV
         spzoj9SJ5/o5tBtklsBrQCr0SMoK7fKK4Yk1zHmQqMusWfDEI+hcNIPSycQq/y474R9m
         vMri6qwAHgzyYqMw69zVSS6k45aw+Vkmtsqm6vZIWebYCo0oUcCSyEzBy6VRZKvcfLNi
         0t+FA8dTcywzVO3P2qGXqqUlDwdd4NHfcvy24rslGl3j3G3BMsbpnEbmSY9Urh97Z1Oi
         ti9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Lu82jetjKZoOQOEPC3jvQJYlz51BzRE5OKDzPPaws0c=;
        b=isLAdQiLZ0z9nK+8q0gOkDfdeA71/yH5eSlt4jbij+p4ciNBaox4Bl/7Lo/yrGshMZ
         KGvCHVf+ExWNHemrVRZ8IEr5jIyVJcb0IvJjWQg5ixEYxNe6HtO5mpEjQWQePfuLjwm7
         0tjw4bSiW7zb03/7WOUHKrm3BqsFqhKogy12u8Bs3o6K3gNYQVcIdH4M3rfdMEKFltzo
         DmktAKUeZvAReVFPOAk+znKnY+r1nSW9/i4VjNBJurTKWVZKWmgYwQBexNa+Z/I+caLb
         tVrbz+d4Z9hQ6Eh190VPx7zUv8sw2CEy7XDc9ivMPE6xmOGfLGTCcb0CO6l+UUGidWqM
         0I6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Y9wxw4/Yc7dpzyfn2BhP+byF36zd73JVbDNFbTSCUf8KOwgbV
	2GKfMYbnNFISXqtbFmcnGFc=
X-Google-Smtp-Source: ABdhPJz0bPxlBaKwNqy3q/r5GBRN5wKAvSYUV8FhT30319+onOO50UnbgN/Gz0Tatk/mBXipbGvvqA==
X-Received: by 2002:a2e:8184:: with SMTP id e4mr6367625ljg.383.1603098897424;
        Mon, 19 Oct 2020 02:14:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls4850236lfd.3.gmail; Mon, 19
 Oct 2020 02:14:56 -0700 (PDT)
X-Received: by 2002:a05:6512:5c1:: with SMTP id o1mr6069535lfo.286.1603098896079;
        Mon, 19 Oct 2020 02:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603098896; cv=none;
        d=google.com; s=arc-20160816;
        b=sozzm+LIha10Z1Vu5HQMoKyskhJutbnTD6OX9yEx9rn8y3+I93J1TeST7kLNJ8Nz2X
         t556v43f2cLiYASxmv2Hu8RvWG6NJjKQdOamWKjNSa/8muRt/FVQ8p7HZl8sY+vm+aWE
         W4lXM345VbesUGd8KqfrLFijWvgcYGQReGo6covAv/iKrE9lyYU7BeObB7itA/6vhnyH
         PUloSU6ir/AAw3HeXIhLz0ByK8jMtjAi+RNj08/3dkbLpicPWsPlXXAjOZZSHA7BE+CH
         ry7g7ZACV//QwgV5GHR4XQ1cfLR5qzP4vIAOiqZGr9+HTmZHZ5dapz9IPaXzNNEzyvn8
         pZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=9Ye8TZZpz8mp6FkzZUI3x+nI6Y22JYpgW4PRAb/Hev4=;
        b=WEYbrKCq2tF/8CP5jvSWdbA3Q2NmUx65kC/wG1SdNeYphV5VdzTUO4/f98RejbnEaS
         EaTvCAthepE82Wnx6oWveEPe/t6sP3kn0Fra+RXoGl3bnRMlY+VHg/TbHbzhlG9+3nHV
         xJZ1ieuW70aM+zFuQCHLwIxxsz7AI9R39rRAVXBh+8tS1SC0v8Zg2dMAlmRhTlhZEb+c
         OVMjcmVfI+6r+EgG/vAxCZ8CMIZxCEhNYFSb/RXd2MRtYQqVRE2wkDtwvVjriDDtXSUq
         tsoVRPWYJI8c2Mrvg4a9xq86kD2BhXseBG69rryx0Va+zgzyhAm1DvbG3lXzMWyKzobm
         +yRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a1si359672lff.2.2020.10.19.02.14.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 02:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09J9EtFC032212
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Oct 2020 11:14:55 +0200
Received: from [139.22.33.96] ([139.22.33.96])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09J9EsBS025950
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Oct 2020 11:14:55 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] pci: Tune error output format
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <bd3fa750-7d6f-5ac5-1900-da3abda375a8@siemens.com>
Date: Mon, 19 Oct 2020 11:14:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

There has been the request to prefix hex output with "0x". Also, one ":"
was missing.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/pci.c | 4 ++--
 hypervisor/pci.c          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/x86/pci.c b/hypervisor/arch/x86/pci.c
index f03e6a1b..c979cdad 100644
--- a/hypervisor/arch/x86/pci.c
+++ b/hypervisor/arch/x86/pci.c
@@ -201,8 +201,8 @@ int x86_pci_config_handler(u16 port, bool dir_in, unsigned int size)
 	return result;
 
 invalid_access:
-	panic_printk("FATAL: Invalid PCI config %s, port: %x, size %d, "
-		     "address port: %x\n", dir_in ? "read" : "write", port,
+	panic_printk("FATAL: Invalid PCI config %s, port: 0x%x, size: %d, "
+		     "address port: 0x%x\n", dir_in ? "read" : "write", port,
 		     size, cell->arch.pci_addr_port_val);
 	return -1;
 
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 0f12e8b7..9274a0b1 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -434,7 +434,7 @@ static enum mmio_result pci_mmconfig_access_handler(void *arg,
 
 invalid_access:
 	panic_printk("FATAL: Invalid PCI MMCONFIG write, device %02x:%02x.%x, "
-		     "reg: %x, size: %d\n", PCI_BDF_PARAMS(bdf), reg_addr,
+		     "reg: 0x%x, size: %d\n", PCI_BDF_PARAMS(bdf), reg_addr,
 		     mmio->size);
 	return MMIO_ERROR;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bd3fa750-7d6f-5ac5-1900-da3abda375a8%40siemens.com.
