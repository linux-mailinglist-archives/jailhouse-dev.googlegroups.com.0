Return-Path: <jailhouse-dev+bncBDBK55H2UQKRBXH3WSNQMGQECRGE7YI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBD562490C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 19:07:26 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id f26-20020a7bcc1a000000b003c03db14864sf889574wmh.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 10:07:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668103645; cv=pass;
        d=google.com; s=arc-20160816;
        b=bhiaQx6BkrcBc/eaLwdstzkorkf2pURYLY9tfJQIlc2KYwcIrbunfD+5A3hCg+0/5A
         SDm2ok3dghUE8L6oYpzkWr01R2PzOBZnjlaxV8681oCQ+bEI8qr1SQ7gczCf2ivh4XvW
         eZgB03kbkmtJLqOgTO/F/sEiKkad5xTHGVynMqS+1o/PxbvX8uQt3+EiJdSwi+4eHOpt
         m9EXwNXs0drB/PddILjyrFQodTxc5vdqW/ICJu76K4kWZC+7veXsYTWhUaAsNdzv2dLq
         FPoxL+uFi/oGugWwWt8dWButKy0Z+3RiA0sVPHGi6//I1m3YBimuZrXnuLBMweIn9Vrr
         YFKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=9cXIF0CoiJZauN2F3p7pXmbsLEiOHcYOiddiHEX9h3M=;
        b=MMVMFdInPxng+U3RQYP3ZGrrQYgC3VeAHUt76F6Ae54IgWssGgV40R3Uw651dweD+u
         JaRzYtCPiUOm3UyVKqcMX2hQYcXU1BB8WAmHTiE5rIzDQ6mBabF5qKpN6xCzGklc/Y0i
         wzkSfj2BESpykbdhexOBVJBA0J7kafME97B3N5TDvmgWr6qpOOfHcTJgO9cOIgWvbpqO
         Q9mzI+Aa6mmFxbnKx4tVhwIDoTwiDVDWpUyOSjHRrUBR/U7B8q0gXmmjOgTOF5z/TMBV
         OUxyxhpZIjYCmUVV208fBuApb32+4FAp/IOQRb0O8Fhl5bsTQX87tFP5uZfXx7DGP110
         WvHw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=hfNGu4eX;
       spf=none (google.com: infradead.org does not designate permitted sender hosts) smtp.mailfrom=peterz@infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cXIF0CoiJZauN2F3p7pXmbsLEiOHcYOiddiHEX9h3M=;
        b=P5LocxLrdLf+WueqK34+l7i4pYFieAvQcRkDBghoTyL/rr3qz/pzQaO/si8j/HDZyg
         ZIxjwTbPmeKKECK2J3quS2+WVoN8qTNuRpEnMZwmzDbnKD4LEy/PwW/g60OPHvFsdsM0
         ZfAlKM2JOB9xnHX0B0ElKPneyTnHltZBJTaPQWX4ysyobT4M5FDprsK9BXwcKG/zZLim
         YW5kiuihkzzKd6IOcKyfiLcJno7Cja2luoJX7LRvsXf36m+uwaKLrRJaotQvrLIuk51J
         J88U0HuUYo+A6GE1Phzm/J0IQ5oK4rR9GmUNUSIvDPDvSe3qgxnf4XQCXNgG/g2R8sSa
         BLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cXIF0CoiJZauN2F3p7pXmbsLEiOHcYOiddiHEX9h3M=;
        b=6Wc04hDPL1970I7YmkUR4fSksqgEAnWenTVkQaBV+n4q0nFX6nweaAfwmcv2zfCMUH
         ai2NBQ3OnnY6jjJsijNVKR89kOxZWDCA/Fx8ZWnsdSjahwfcSQVOOu3Y9bEMm9H9Ae0x
         6zoMIjTNVT3dhgLz9dXTHAjsP5tn3oAJUPF1qiqRPf6esTgSzTPN5WXcmavkJyoR5His
         qImcGirXM2Z3cOzqTL3m3fDj5NUKK7w/F8gRKV9A/Q7jd/MeL+posrbm6NLLLBna9z6A
         y/7s+3EtniPEgdK+eV3sd0XeFd1gTvpAkXJveOaN7bJEX2alNuRLknWfREiR9nD5U4ZX
         nwrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf3e4ukA8IfjTXLaGepJ2CwM0k7jMY/WL3z1IL/0FkfZLYTpAzIj
	t6GbWzJMCV+c/HYHVGTPIyk=
X-Google-Smtp-Source: AMsMyM54ISLtF9kKMHdiT4rza9QMtzN4jfeje0wEVtcvg1jHj99gWHGNpPn73bznbkxenw09d74RKw==
X-Received: by 2002:a05:600c:14c6:b0:3cf:6a83:c2a6 with SMTP id i6-20020a05600c14c600b003cf6a83c2a6mr42215330wmh.52.1668103645552;
        Thu, 10 Nov 2022 10:07:25 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d231:0:b0:228:ddd7:f40e with SMTP id k17-20020adfd231000000b00228ddd7f40els1976180wrh.3.-pod-prod-gmail;
 Thu, 10 Nov 2022 10:07:23 -0800 (PST)
X-Received: by 2002:a05:6000:154e:b0:236:8ead:3eb4 with SMTP id 14-20020a056000154e00b002368ead3eb4mr43279785wry.71.1668103643858;
        Thu, 10 Nov 2022 10:07:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668103643; cv=none;
        d=google.com; s=arc-20160816;
        b=YC4OwnBkoaaIl0FiKH6zywKSS+JwRTb0Vsc1MpiJcD7biCpREor9/9vv4yiIWeu47N
         0CkLwHP8sbABWmlxLaSDE1yfqXH/BDHKPIvt109OX96TRFjRMb6mYaEMmQII5kNSBugc
         tCQrs0I7987PbqLiNYJ+l7FvXHf7YuY7OroqloCi55LoUYgUygJNa+mga+jIykbrT0ni
         /zhH4Oz4TlFl63QpG+WQp6IUxSn2OTcb2mpzIxOYp533ul8QT3Ifqh2cy3rrVIl0nTQO
         7qx8oVRzrdq5M5tVngI0BFl4EbGgjjLSwsbS817AQPS0syNWxdL1G2i7ggxorGjgcn6/
         s4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=TAqMJ9XEgcb7EhZe2sWVJH4nswduJ2xyoOUcpLbLbEM=;
        b=N/6LTZHdYGQf8m/fxFQXUKytwD5/Cf3HoozsSG6NMtSrfbPmPdTk5SW00BZ2FGgFAj
         hYSlUDYpQnnVAfeIZMgQINJ2kDp7Fpxl/RT6TTtDX5RzP0i7L2jBTIGdaPRF/eDQax4r
         UmtsZcOr9r/CUvNme6HYbBIhcqhqzxxMFjmvF35KWmdC/SRNJKFnzp6uttrDm8u8RC/Y
         xMoNphhVbzWDOZ2DfjyNvn0b8/D1Z0bPt5tSXogUrRunNItQP1y+WddjdriRkw5PuhId
         wlKKLp5riSE+tUqa9CkPex3Hxc9cHtMe3iIAA6KC6GRLLmsRS5X3QcjbrnURLhzDdBIP
         zGVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=hfNGu4eX;
       spf=none (google.com: infradead.org does not designate permitted sender hosts) smtp.mailfrom=peterz@infradead.org
Received: from desiato.infradead.org (desiato.infradead.org. [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by gmr-mx.google.com with ESMTPS id by9-20020a056000098900b00239778ccf84si614914wrb.2.2022.11.10.10.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:07:23 -0800 (PST)
Received-SPF: none (google.com: infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otBxJ-00ALFj-P7; Thu, 10 Nov 2022 18:07:14 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5777E30041D;
	Thu, 10 Nov 2022 19:07:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3CDAE2BB18BCD; Thu, 10 Nov 2022 19:07:12 +0100 (CET)
Date: Thu, 10 Nov 2022 19:07:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
	dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
	trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com, xen-devel@lists.xenproject.org,
	jgross@suse.com, boris.ostrovsky@oracle.com,
	andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 2/2] x86: Check return values from early_ioremap calls
Message-ID: <Y2090DOT3q5CX9kV@hirez.programming.kicks-ass.net>
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-3-ross.philipson@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20221110154521.613472-3-ross.philipson@oracle.com>
X-Original-Sender: peterz@infradead.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@infradead.org header.s=desiato.20200630 header.b=hfNGu4eX;
       spf=none (google.com: infradead.org does not designate permitted sender
 hosts) smtp.mailfrom=peterz@infradead.org
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

On Thu, Nov 10, 2022 at 03:45:21PM +0000, Ross Philipson wrote:
> On allocation failures, panic() was used since this seemed
> to be the action taken on other failures in the modules
> touched by this patch.

How is the panic() more useful than the obvious NULL deref that also
splats?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/Y2090DOT3q5CX9kV%40hirez.programming.kicks-ass.net.
