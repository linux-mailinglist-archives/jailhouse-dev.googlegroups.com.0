Return-Path: <jailhouse-dev+bncBDV37XP3XYDRBTMM23UQKGQERD6MVWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3CA6FCA2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 11:47:57 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id p13sf18885937wru.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 02:47:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563788877; cv=pass;
        d=google.com; s=arc-20160816;
        b=UzKpKxe86ztv8LhI9FGZ5zCRkY0whT1Jd21eKLb3e7ExoR6gbH5dZ9YTKkhPCyLRuP
         5ITCHpM6E2H4trtasRGW15V5MnVFFeot0mh5vzkTWLcmWgfU9mexYaQ/Eg65e4D9PlQV
         oRHgE+fGL7sPrVnkV8JQk9iHTwzQFWA/cv0h0u7bcIx7PEAH/Jz5VzFqlqv1jtdUX0RY
         iJa4Tk57vj9Vy4wZQ65oJ6QaiYxkEjR/WFrqK/9iMk8D4Yd8e6zJ07lCQ+W4e6bBUZ2M
         Pb8x/93uPtsQBIJAHRv6rm/UxXZS4v/X9g/zciImYVvabiaBAfmpKmCGDi6LCuXOQJKf
         tQkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:sender:dkim-signature;
        bh=MqMM+7vOqGa05VgQgZYfCHwEVixWX2Pp9ytMfIlBsmU=;
        b=HVhbFxMZemFelXQ5vnwJuWBT2aE5I+5ziXAr5jFsNbPPFQivuyWXTFUIG3+ziS5jA/
         +86lcXLBFg5aQfvIPQRhpcylgA9MITxZaK6U68eI2YsDxCGi9igrqfFhfqRA6w3upf68
         M4FRjaeeKzrYU1wR9QHi4T9+KNGfGX6bgb2L3FL4gM3wgz2eMhxVmArhtyVGza6GLOxZ
         XvaJrIUaTI+cM2oS3WJnt8pAs0tTQlI04ACpPgjJ7CEgogcEvJwvYYDckPd01g0XJ4FA
         NcEXGXgiWwa/p0UxAg1U0ySLdxp7ggvgz1gJ6dRLvvO/xxsnBkzERLd/EiPC1eNkGeXE
         DHTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of mark.rutland@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=mark.rutland@arm.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MqMM+7vOqGa05VgQgZYfCHwEVixWX2Pp9ytMfIlBsmU=;
        b=GDCRMfoqUbZwHvgIFT3vZ8d8MVikFzXe6q+dnYsoW+XJeaIQ1jYFnfvggyu7lQxDyN
         InpclybYlhgSxmPZCP5tNJ9Bvf/odKDx0dTe3V3KZ9OMZKxXwmhbQUez8FPOR/fVi+n5
         WS4/B5QwJnNp7x3TPc5ebqKys/sOc3MhXabqWhi1Js3bm0RR9Qy+YH9s1+2VHcMDdvgk
         H6fIEP/F/MLIqgmwmb2128GdnujnIbZbxljxfLU5Fn/HCiQSx3VcTC/BIDNhZ+hWX2CP
         8YZcRBl0yowCIo4bl1D+EOOz3+KuYaJNtbFT1/CVimECcqnVVxHUx5DLdeO70+k52Kl6
         OBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MqMM+7vOqGa05VgQgZYfCHwEVixWX2Pp9ytMfIlBsmU=;
        b=CBchHWHnHWhhcXjuVlsydd9V7aHNiFSRyY5bGOeEfREzaH1o6SJfZyzYHtfzbeGW6t
         5WtJQeJ6Du+dVpTQY3ZgDBhqfAp2pb2Q0yqvz6WzuHA1VXm9Skz6ObCkdHbhoTvOGAnB
         qIfMbKbXU9hQzB3+QGLSKSfx9CjyYTHND9CuhW2tDsSi3NmjupaR0Y1qTZHZxNwaVE22
         vfIooxnlPf+QLP/RYB3grKhVcUuNGsEyeRlASIu31E0X8At98CFrgd03akpnZYHTQ3zu
         WP73mygf9cdqpiKotEzG3tQBnmMsGX2CvY6UMmWCTZlakT0eZVDCtfJ1BnQ7ZjREiItd
         ACaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbiXvd0jg/90pGNN+meDC47c8CD2CPx2COOY+kRuzgBUCrZtRP
	eSXK5ie6QzOyZ/X764Xcx6o=
X-Google-Smtp-Source: APXvYqyC1Cvr2AcFqjZIxEe3ku64O1DLIiCg7MPT+mPtHAvEmvjToGm8LdvTdnUOA4te9oZJP//mRw==
X-Received: by 2002:adf:c803:: with SMTP id d3mr51821821wrh.130.1563788877365;
        Mon, 22 Jul 2019 02:47:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c411:: with SMTP id k17ls13934514wmi.1.gmail; Mon, 22
 Jul 2019 02:47:56 -0700 (PDT)
X-Received: by 2002:a1c:c5c2:: with SMTP id v185mr66753118wmf.161.1563788876780;
        Mon, 22 Jul 2019 02:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563788876; cv=none;
        d=google.com; s=arc-20160816;
        b=N0Vy/oNGfJaWf2KhlsZqNOORuBLb0gC4sqD9jE6w5/s7NWlSFrRToDotrSyunEXb3s
         Q12bITEoaX5FFGHlShCMFBex8i3LF+R58fqD7bSIUQaKQovI+p01z2PzB65/02hk3Q54
         2Fu3yo6gZGGOc6Su/t9lRov+To/GM2kUaLICYQjtqxdTzHc36sMg/qfTNNxEe27l4aEq
         LquPM62iYSIyIPUSkKjM1vpkBdv1VpGhXwU6HXVflAj4dFwS2Fa24i2asjmmUaZQQfpu
         knrjyCSct5MVY9dK7GfP11/V+SVISCideAf6Kn9sGI7faEO+eWTMg3Wzh9RPLiH6D2hu
         /zow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=wTHTk2MOlxUbUgX5zTdfskLF5CGxF8J6inl68f3v6G8=;
        b=itO0Sre0NzXC7WHeSzFFyLdSS4MzmTsRiLriG1Rcw2a4ZfKQyR6bUF5u5J+7flEkpP
         hRuk36mMq0KnyWx50cI+UrgypaZIfIIORrWezBFSVje/fC8+o0if32xfL8vSnKksn+1l
         LKC/crIqPlAlXSFYKA5Jh8Wk5FftIeKn62jnQ2Ss5A83aAeelKVZYm+8hlDtV3ldSQai
         Gd7+Y07GSMYD6uDUDXkQ7KWBN5DHQqckFeBrEdtMfkfn8twM18rq7rEzZoGbLLhM5+Ww
         qcYaAdkXXzUg1G78Jad96ZhiyJ4YYLsVMoWolyVeOMcBB6GZ0iJE+PF68FMDYkvMgFSR
         e3Jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of mark.rutland@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=mark.rutland@arm.com
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by gmr-mx.google.com with ESMTP id y4si809827wrp.0.2019.07.22.02.47.56
        for <jailhouse-dev@googlegroups.com>;
        Mon, 22 Jul 2019 02:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.rutland@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1655328;
	Mon, 22 Jul 2019 02:47:56 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A4913F694;
	Mon, 22 Jul 2019 02:47:55 -0700 (PDT)
Date: Mon, 22 Jul 2019 10:47:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>
Cc: JailhouseMailingListe <jailhouse-dev@googlegroups.com>
Subject: Re: 64 bit Hypervisor crash at 32 bit WFI instruction
Message-ID: <20190722094752.GB28400@lakrids.cambridge.arm.com>
References: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-Original-Sender: mark.rutland@arm.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of mark.rutland@arm.com designates 217.140.110.172 as
 permitted sender) smtp.mailfrom=mark.rutland@arm.com
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

On Mon, Jul 22, 2019 at 09:19:50AM +0200, von Wiarda, Jan wrote:
> Hi all,
> 
> we implemented support for Jailhouse 32 bit inmates running on 64-bit
> Jailhouse on the i.MX 8M Mini and it works fine, GIC demo runs without
> problems. Now I have one problem, that just occurred. I'm trying to
> get the ivshmem demo running in 32 bit and it does work until it comes
> to the line
> 
> asm volatile("wfi" : : : "memory");
> 
> When I give the inmate CPUs 1-3 in 32 bit mode and the inmate accesses
> this line, the 64 bit inmate CPU 0 crashes. If I comment this line out
> 
> //asm volatile("wfi" : : : "memory");
> 
> both 64 bit root cell and 32 bit inmate run just fine. Now apparently
> the 64 bit Jailhouse Hypervisor has a problem with WFI beeing executed
> by a 32 bit inmate, as with a 64 bit inmate there is no problem. Is
> there an explanation for this behaviour? I guess I will now have to
> handle the WFI exception. How do I know the inmate is exiting because
> of a WFI, all exits I see are these:
> 
> #define ESR_EC_SMC64			0x17
> #define ESR_EC_SYS64			0x18
> #define ESR_EC_DABT_LOW			0x24
> 
> In the ARMv8 manual it says, ESR_EL2 has an EC == 0b000001, that traps
> WFI and WFE and there is a define
> 
> #define  HSR_EC_WFI		0x01
> 
> but it's not used and it's for AArch32 only. Now I wonder, what's the
> best way to handle this?

AFAICT, jailhouse doesn't set HCR_EL2.{TWE,TWI}, so WFI should never be
trapped to EL2.

Are you setting those bits (or leaving them preserved) in your 32-bit
enablement code?

Thanks,
Mark.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190722094752.GB28400%40lakrids.cambridge.arm.com.
