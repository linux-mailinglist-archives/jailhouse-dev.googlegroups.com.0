Return-Path: <jailhouse-dev+bncBCXKBPVPXAFRBN5HR72AKGQEQZHK22Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-f64.google.com (mail-wr1-f64.google.com [209.85.221.64])
	by mail.lfdr.de (Postfix) with ESMTPS id 5522819A289
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 01:35:20 +0200 (CEST)
Received: by mail-wr1-f64.google.com with SMTP id y1sf12562131wrp.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Mar 2020 16:35:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585697720; cv=pass;
        d=google.com; s=arc-20160816;
        b=loIosYkQketxKx/UULm21Lc0l8seSP/YPNntLshF3bSiBpgVpjU2MSXd4KAfIZ3ecZ
         J9w2Wnq2D2Y68IdIUZ1uvZNuh15spI3kbtSCAVA0lr5lTOuDy4/6+psqchKh1WYVQ3H/
         0lgC9KEna5C1nskAOlRN6rC0xAtJ26vYVa276BZOvTlLLwOMn343PQzxJLekS02rCddY
         9eSbASkqR8mISYAbisuz3vGF0ISgHS9HCimJtN0gFVsz/wdoPOmrmMq9ZCefuDFD7kA9
         4Zxd8A1wmYN+sMcEPfB1YXhAoUHAVNh3GS8ywMgdAbxm8yX66bxj86mC9RJwkOzclKOP
         OqYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:message-id
         :in-reply-to:subject:cc:to:from:sender:date;
        bh=39HACMPQ+DPYSxccAL7XHY5aKbo/xvKLcmq/dPOBp0w=;
        b=htOQV3Tym0sW+TthzDNOxiLQz1tRvw6LXkt0Vi8Ecngm7vz5zNuzfaCiSh91WTWIax
         F2et7pzqDm7cQ5WReQc8zWXJbCTTPiC4zB5TrfFdb1b7uaoZ5C6/mZqGpAvk8Wgq71Xn
         22VDz+kZj1QYPHHemVKBN2n331sLEenlUJA0RRacwNRU2ycyxSIfj9+t2yLyAOw8c/5l
         P0xSX7WNpz/qI7nSyJyGSj3TpGcVIyexGousgf6y2G8echfyktcVcbNzAdTxnucWabIB
         FCUOSg9ZCewUmqSja6GRCW46F4I5+CukwuxdpVjKfYxphCLJDXJJBCcE3jhKPWPCQsam
         3DLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of macro@linux-mips.org designates 148.251.95.138 as permitted sender) smtp.mailfrom=macro@linux-mips.org
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:sender:from:to:cc:subject:in-reply-to
         :message-id:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=39HACMPQ+DPYSxccAL7XHY5aKbo/xvKLcmq/dPOBp0w=;
        b=ShexwQnTpTrW1ugNUmspqatRindqMt3psoQAsFKiJ4q74vdOkkh/o86GvMY6I7qoVR
         2SIV6T3gB9JWtd8085pVQqUMXyQwnx4/Dtw/5AJaX0Gy7AGCScMxSENUK1zUl50rF/LN
         rR0p2llDpE2c4Y1JCcmnn00h/D+XTSeW/GnPIPeqDNTVMQwzZqbuubSj9je7LMLszWj9
         TMMKic0DQ5EaCHofqdHnF62usxN+1XpX+bajH4VPo92AKlTr1xISLtlwR7SY4cDEz1ut
         uof3DOLK4qxBygw57usXVKo/Dc6UkyoZjNK6FASFZ53jbeJhwy5XCgCeIRT3wyzgvUjC
         E7NA==
X-Gm-Message-State: AGi0Pub+eulW8dwpeQ4pOBJBws1xtlHtP1WPRBEcc3Y4ShInIICoRi6m
	JxTgTIBdGvyAa7p//o02+PQ=
X-Google-Smtp-Source: APiQypK66+OV7HJFlx5d7fdz+ugvGtKGp4DLwyqNw2qM8uZFEcFaDzAKVNE295YY08gFBUcJxmuReA==
X-Received: by 2002:a1c:e1c3:: with SMTP id y186mr1250697wmg.151.1585697719988;
        Tue, 31 Mar 2020 16:35:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4b07:: with SMTP id y7ls2144537wma.2.canary-gmail; Tue,
 31 Mar 2020 16:35:19 -0700 (PDT)
X-Received: by 2002:a7b:cc07:: with SMTP id f7mr1295392wmh.126.1585697719435;
        Tue, 31 Mar 2020 16:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585697719; cv=none;
        d=google.com; s=arc-20160816;
        b=ohMyOCH8n9qQY8aYhgKCPck7EcJACWqtnH1FkPR5Udzoel4JS2LXK49O/dWWYD6jC4
         cUBAnKhydf08nXiA2XMdD4RVvAUvlBZasXzSwz36c5tfRuANfk9cjns7c57Z+HeeSolC
         gXsjQ0Ykz6Q67OErCFBqc3cS91D5Faw2PMF/GYak6T32nIauoNvksM9hijOqGmxo48vI
         VZ81Js1lRkOs1QbPZESgX64Wwr0L/aGxFIIfstB8sVoWMgqiDBzwAKI1cIRhq0w2+Nv/
         2iuJGr5FOx5tPQIC3ehB1oQ/NylQ/uaoRLPYpvgIx26tL4R1fDldprBtV95dT5mc16Md
         gWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :sender:date;
        bh=1QK/mus41cSrIbucDjB1hwaXOOFjBCxptBtFwqCREgQ=;
        b=Tlil3CFryCpQEDL50onDwRojXKDjibHZOF37HhtHrc9R4A5S9W0H42robhoqvLhIOG
         KPq2/cTGIjRMXNLosByIXNhroax39lHIAxfrClRjC/DB+/fnhe9e2isP/MCsXBWGoZpa
         h9rYXvTg9cZw3tujpBKrevhr9JsGLVYmcFVhpC/eCCJYgKQ2kzsyrROL81oazPBYWVbK
         9WAH6NWPGaqze07OqmszijO9+mZW6waZWVv7VyRooGGaZWj6RnfOtTN1StrCQ/5b2L28
         Z5Rgf+lS4orqoCkV/jeDG3/u9a+buj2+VTzHUDaU+fI3cUZ9H2ru7D0xnK67WfH+0+xo
         7k7w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of macro@linux-mips.org designates 148.251.95.138 as permitted sender) smtp.mailfrom=macro@linux-mips.org
Received: from cvs.linux-mips.org (eddie.linux-mips.org. [148.251.95.138])
        by gmr-mx.google.com with ESMTP id f3si278105wmc.2.2020.03.31.16.35.19
        for <jailhouse-dev@googlegroups.com>;
        Tue, 31 Mar 2020 16:35:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of macro@linux-mips.org designates 148.251.95.138 as permitted sender) client-ip=148.251.95.138;
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991035AbgCaXfQ0q2BF (ORCPT
        <rfc822;jailhouse-dev@googlegroups.com>);
        Wed, 1 Apr 2020 01:35:16 +0200
Date: Wed, 1 Apr 2020 00:35:16 +0100 (BST)
Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Thomas Gleixner <tglx@linutronix.de>
cc: hpa@zytor.com, Andrew Cooper <andrew.cooper3@citrix.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
        James Morris <jmorris@namei.org>,
        David Howells <dhowells@redhat.com>,
        Matthew Garrett <mjg59@google.com>,
        Josh Boyer <jwboyer@redhat.com>,
        Zhenzhong Duan <zhenzhong.duan@oracle.com>,
        Steve Wahl <steve.wahl@hpe.com>,
        Mike Travis <mike.travis@hpe.com>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Giovanni Gherdovich <ggherdovich@suse.cz>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Len Brown <len.brown@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Martin Molnar <martin.molnar.programming@gmail.com>,
        Pingfan Liu <kernelfans@gmail.com>,
        jailhouse-dev@googlegroups.com
Subject: Re: [PATCH] x86/smpboot: Remove 486-isms from the modern AP boot
 path
In-Reply-To: <87r1xgxzy6.fsf@nanos.tec.linutronix.de>
Message-ID: <alpine.LFD.2.21.2004010001460.3939520@eddie.linux-mips.org>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com> <601E644A-B046-4030-B3BD-280ABF15BF53@zytor.com> <87r1xgxzy6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: macro@linux-mips.org
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of macro@linux-mips.org designates
 148.251.95.138 as permitted sender) smtp.mailfrom=macro@linux-mips.org
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

On Wed, 25 Mar 2020, Thomas Gleixner wrote:

> >>@@ -1118,7 +1121,7 @@ static int do_boot_cpu(int apicid, int cpu,
> >>struct task_struct *idle,
> >> 		}
> >> 	}
> >> 
> >>-	if (x86_platform.legacy.warm_reset) {
> >>+	if (!APIC_INTEGRATED(boot_cpu_apic_version)) {
> >> 		/*
> >> 		 * Cleanup possible dangling ends...
> >> 		 */
> >
> > We don't support SMP on 486 and haven't for a very long time. Is there
> > any reason to retain that code at all?
> 
> Not that I'm aware off.

 For the record: this code is for Pentium really, covering original P5 
systems, which lacked integrated APIC, as well as P54C systems that went 
beyond dual (e.g. ALR made quad-SMP P54C systems).  They all used external 
i82489DX APICs for SMP support.  Few were ever manufactured and getting 
across one let alone running Linux might be tough these days.  I never 
managed to get one for myself, which would have been helpful for 
maintaining this code.

 Even though we supported them by spec I believe we never actually ran MP 
on any 486 SMP system (Alan Cox might be able to straighten me out on 
this); none that I know of implemented the MPS even though actual hardware 
might have used the APIC architecture.  Compaq had its competing solution 
for 486 and newer SMP, actually deployed, the name of which I long forgot.  
We never supported it due to the lack of documentation combined with the 
lack of enough incentive for someone to reverse-engineer it.

 FWIW,

  Maciej

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/alpine.LFD.2.21.2004010001460.3939520%40eddie.linux-mips.org.
