Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBKF23D5QKGQEY3GS2VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33C28065A
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Oct 2020 20:17:13 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id q19sf1367748ljp.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Oct 2020 11:17:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601576232; cv=pass;
        d=google.com; s=arc-20160816;
        b=ITDqSiwDMPt9wErphctkyhkJ+y7q4Mr8/d5pVnF7g6jHae9m4j4xfPUgTVZNzZbMwK
         9co/ARkH8LHn2SkqnqpSxrIcsNhQ4CFtQIOn5uy001+PNF2NZtlZCi042NcNaxBrUwKV
         HY6oXI/ayfCBqq0ohQhTdV0UR9CLvLe72/PV+yUdf62BfAmncqo24IPAi1DZbUx3jvRV
         7q4Q2EY16dSsSWScK9bPhk1q+hdxaXN7j3/kCk880CHz65/DVk8UEmYcSlX8sfxrcYtI
         01MuxBb8J4tZgzhslb7VNjx6waxyDn/kRPM4kM5C/0pEHPg9Gg4i4zf/1NmzLbxoLWsC
         mCJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=PrF2OIlB0tI0S/sLmKvLrRxFG9H16IyXvLdIcSQomRI=;
        b=xqLmrkvl/C8NfxsVCJbCriNPi9yb9v26BNaRNjTAXP0Q8AfW68lygxvML55vVYUHkw
         AOjPYOI7oujwXHiCdqWVrYEq6hpsDXmzzcQeCBwPHD8UEQQ721JBs6/p7cViC62vNhrI
         nMh7s0vMxB0lSMltkNLZOpmJ7Vxx8q/YQVFfVLakmBdw5MnvsmU90UTtA+BSi4Ozt0kw
         W2rwCuHvAMtGrOuUgKNMg6Jx0+rbEM0uKMsVTqNuPl4w/v2dpRdcqwx1hgq/KR//BRFf
         dZmp8M+VQHl0RGj1ypq6XBwvIzpH9bPhECqf7H2BiL4fZ1BQyymKa7GaiFudY0Z7oDQY
         YTWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bOy9QGEI;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PrF2OIlB0tI0S/sLmKvLrRxFG9H16IyXvLdIcSQomRI=;
        b=UGAha8vn+JxJWjSkqyISG20LvxWk2YUF+cboil2WxKIZ5WBTFUcc1rLGz7mWqTqVRL
         qLZiTOqjJiH22V/yv9BCSrS9t3zDUGTgBCC/hybrZHuIZGxjZx5co0MlaI2H65WX4zvx
         wlm2x1lff4IR3hq5SBdYcvG/sJSNGh2iLCbrqmZpnMqCjVHzZl6HtUrj+fnak05U7+0d
         u7dZ1zbCWmt0vARZaorQJl4EbUBhIugqecPQC4kmIrjWEze6j1lwrH9iayIFQPBOycsM
         mYsA5W1veUrn/dhnO/6irbzej/pbN158KZ80TCHmfWJj91kKPj0Qjs91ynKZDj5GQpxc
         rMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PrF2OIlB0tI0S/sLmKvLrRxFG9H16IyXvLdIcSQomRI=;
        b=krvOwOCINKt58gQP3bCjXcNQv1p7iz817Bqq4zqOODAbbstPIdvVC+PWoLMlnynWbd
         cFJWcJ0WTn7aOt49iNM6XKeYOE/5gJGoq5Lht2QxXkBzhJoWUYTcUXptKEHMnFGghiNG
         tNxoNBaCjaacqSkFnE9qEjgfWLZp101o2hDag6VafWffkdejXzxeDVjx0fp13LORaAVm
         69Ebah4RDq19BV0BliGvfcfLMkMh/Wuw7RvH0RzXjb2JbR4LdtDUfidY9wpZOXTVXsgu
         XwZQtokTM61d5HS24MA1bPK0YNJd/eW8bG1fBPullq8YPrggfR3LPyGnUXwKHBzsMsTf
         9qNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533l0+tuRH5TD40LwDb8X4JJHRaj3mNvxmD0OS5DhY0oOt6Yg0d5
	8NdxgbX4ilOZVPzPFhEvSrE=
X-Google-Smtp-Source: ABdhPJzCHXtNjc1WL53FdNun8Y9gLIpgjF1pviSiuZWaAa//G99KyQMvsRpPMrxjv8Mbv/rq5DBThQ==
X-Received: by 2002:a2e:9143:: with SMTP id q3mr2944784ljg.253.1601576232730;
        Thu, 01 Oct 2020 11:17:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1763257lff.0.gmail; Thu, 01
 Oct 2020 11:17:11 -0700 (PDT)
X-Received: by 2002:a19:ed13:: with SMTP id y19mr3388293lfy.187.1601576231518;
        Thu, 01 Oct 2020 11:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601576231; cv=none;
        d=google.com; s=arc-20160816;
        b=i9+Y9hh2nSz8ByXbC/WIMpDQ+hKgZPRAdUfL4xkemOqILugEG7leMt33jirEa0umcS
         Tul7Wi0rFuL2+1+m+BIlWWDhBbbpAHeHACOkdA+V1JMj1/hQTcJv8hxnt7MMKHH16wU4
         MAXzh5DOs8rHTwVihYpJdyMgYlr21Dp7VOWx3zquOISLWpxpYga/1mvxdsfyUpOZCGW7
         9eGdLR4LsiR3GoTnYC5tIVQIAT8vUDkP3cjn6ZA+mA8RhsONG9OxO+exHSZN8udIrX4i
         SdElKOPCu1qZaH7nvy7tnx64kgVE63v9zwWPp0tbosKqD4LV4OrvcY8BfxT0DsDiJL2Q
         kdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=ST0e06HzbOsG1ErEGHHxEHrmSPjdS4IgmF89fW18Ibs=;
        b=T9uJ3YDVFjepbv/aLVwjgZRTgA75xhA3GDL0kmtSJAWJgp81hSbpjtiQZWh3ZQiOiz
         juCT6eu+JTi1/kLLEH9gMZ+kEpkhv7nmc0sH0s0dfbUL9ZOxvjsXAZumbjfoSgL6rjK3
         zkszt8Y+fhe+oWOJ0C2WxSYC7glynfNvArsJYE9J4Sg6rokb3ezELHWQ1RINSaL35EWN
         scgouSp9VGIh1YxknF2uxSIiP4haxiA8bFXAHNunx8x4cfThGMDf3mIpArjL554kT8ms
         Co1W2aEK8bFOZ1AS8dZCfKxiAHjrjI5CJrsYXwhGxoBlt7XUHbvHH1Tm4/v/w+tCcfyx
         SqyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=bOy9QGEI;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id y75si148103lfa.3.2020.10.01.11.17.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 11:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LoLKj-1kvQxL2vmb-00gKjy for
 <jailhouse-dev@googlegroups.com>; Thu, 01 Oct 2020 20:17:10 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] x86: vtd: Fix interpretation of redirection hint
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <efae5a29-91ce-6550-984e-c3431429beb6@web.de>
Date: Thu, 1 Oct 2020 20:17:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:us33SNN3mAodDwsjVAmCU58sQpCXnm61sCTFXfBZU+2wBTmTyzJ
 NJ5EkF5320OZ28jx4o241dcvnnmbU+96gQGDJIuEactKZGQI87ok5g0VnsUT8kYEqH1V1Xw
 /p1vwXY48hmbZRxyCD1yqSu3stV2YFT0/ReUtm0rVltZDZVim8bIyReb5FcdoT4OhxY5Dg3
 2HcrIMLDiTMIWQZErmCcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vSv8mE3zJAw=:zM2vbZeC3Dcjun+0C4iFhd
 WTglshMQH9ID8rf9Ak3cSuf7PuS0klZREfGjZRF/wLaEjvvgh216wJfUpiFs5Fvzjw86n+12w
 o402ZsANtKhvYs/6av/oerA3jjNLIlYmjiJqpSwS6sAVmpG7MyMWo6B+/1fksDsCcNkTpu+nT
 NGC8QdNBWerHrpM1XNW3meQX/hL5qNDWYPX5fmkX6mNYmIcnzvP9gIKW6+g6ldxLeg2o4Jl27
 xBsBVGws09Qnk0uf814TV/MqTd4dCil2QpTSsSvThFzW3dXoluOBSWyz1qv/WeHk9Rt44TeqE
 T5IJvi6kSoz+Z9MozfQCnJmV8jQFp6kWpx+hzVzpfU0BwnDEPPXquvLn/5BD5H/CWihQo7g74
 GVIb6Xn5+vB8lh/vgBJaHWT4akYqQEgKri8UKDLFK9kKiJQ8xDUvW5W+Mc8dtwW8eMyz+pvAv
 d3/W4e6AdvDWtsKq0V9618ABfTbccKivxa+7IicxAsO6IXEwpCQVqkP4jPN+5z0VRWPBDhZbf
 fAtvF3YStORbHMNl3CXjHNN7Wd9UvGjFiNYWUHFVKpMYaH23cHzEnzsRqPQas2KGKXrSjVai+
 UvQSIqcKPRQneGFNHPPvJCHDVMUItAEnKGT70pQsThqhoimwv/iAyxLLfxlbJRK5HwsDRdgaV
 OT1MW/nGulvcD6+86vtotvb50N+ll2tzD75G1ZJZog2ao2nDlFwrEYgWcbuvZ4AYdS0BBI4Zn
 5bazkLisyIa7m83KQp6lFUx9tLLp0r3XfD8A2WFckqeVr8oCkuN2gd4P2zEu94Bj2AbzgbZX1
 COKf+VDoP+E6xUSDiR+sgePgTHjK0dBm6lcCfHsI6OEzdnTygqSH+Y57S/MOs4UtIoe6T5ibH
 ZVIIimBHK3aB6scW/733p1kw6w5pBNKzSNtRyO5AdBbJQaO2DQopK6L7ijDTYWoAEP+qKVjU7
 QRjM/qTNthYS4D1WzkB70xjM1ghQjN0lUtNWCBcvGJbdAwY4j/Vcv6qbl7dH2VCRN8a3hSGtB
 1pJTRawUhGlzuhH3FySdmuIz9tqpAIiaYbLXZGIcE2SNpzqaYb5tCUqdXruXYMAhfZF+ihMen
 BLP2qcjGP+hEO5SVWU6Gb/5qH/zHYrdh52DKdfTs9kZoWw4zlwbpq422hT0Rm5xMWuSmqjN2D
 1TuB4JuybBQOlgtHWMY6ngCe8NlkCfn7v/IGDxzMizdMLPplkSyDLYGwJ1E50j4GenYGwzzyi
 9DhYJ8BEoFxF9S7OiYMw6KbrzdhE0K/nImA3Eaw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=bOy9QGEI;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

Reading the KVM code of Linux and re-reading the spec, multiple times,
it became clear the RH only controls whether one or all CPUs of a
potential target group should be addressed. If it's set only one is
chosen, via lowest-prio, but that is done by the hardware. For us, its
state does not matter. We always consider a multicast scenario, thus
simply ignore the state of this bit.

This fixes startup errors when DH=1 and RH=0 of the kind

FATAL: Unsupported MSI/MSI-X state, device ...

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/vtd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index e33b5ff4..c072ba3a 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -849,14 +849,6 @@ int iommu_map_interrupt(struct cell *cell, u16 device_id, unsigned int vector,
 		 */
 		goto update_irte;

-	/*
-	 * If redirection hint is cleared, physical destination mode is used
-	 * effectively (destination mode bit is ignored, only a single CPU is
-	 * targeted). Fix up irq_msg so that apic_filter_irq_dest uses the
-	 * appropriate mode.
-	 */
-	irq_msg.dest_logical = irq_msg.dest_logical && irq_msg.redir_hint;
-
 	/* Validate delivery mode and destination(s). */
 	if (irq_msg.delivery_mode != APIC_MSG_DLVR_FIXED &&
 	    irq_msg.delivery_mode != APIC_MSG_DLVR_LOWPRI)
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/efae5a29-91ce-6550-984e-c3431429beb6%40web.de.
