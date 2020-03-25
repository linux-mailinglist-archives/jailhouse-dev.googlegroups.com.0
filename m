Return-Path: <jailhouse-dev+bncBDAMN6NI5EERBTGZ5XZQKGQEKVFV7QQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C7192B4E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 15:38:04 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id x1sf2278248edv.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 25 Mar 2020 07:38:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585147084; cv=pass;
        d=google.com; s=arc-20160816;
        b=MCAqAXA0hrGqMhnXbJWClfWMcjV8aU8rRQbGo+lIlRJM1OINQdsyfRwQwqGoFMUDdQ
         awMEL5tX2xebmwqQFrCyP27AKGRiPLHbz0zC43zhkHxOOO/dcfvmKZypH/4W1JMs8WgC
         DxRu6O4y307H/Ihde5OTsEv+zyvC+58OWbiMUI9dmKk2xT8oLkdKt5NE1pPl1DN/ed6U
         Pf38ZRTUZrMfdInqeHjUqejH0Sx4cnaup4KmGkjAZxupjf0Yy+gx3hJJZJUp8faPsTpd
         vPLP0Woz++pC6gGKMNKLX2WB1x8KN8dlrsbOnUkf12Y/ta2TgRO6SARwCrnZmcRyK61y
         coVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:dkim-signature;
        bh=ukDIQX9bL54lcOPlsmj443kr15HK+0ZSKFRYVUI4prs=;
        b=i1lGCxXZevhrPT2yU4+49WiDRXWAi/6RYgPyKJClOP+eEhL+9atFtxIEm1LdGVpYgS
         ml71rUnTbhny4e/zvjnnCNBVbWyCG4mWEBCfXYzArM0PT29Uuz2ZwZ+h/YRvrUBB0xkg
         FiV+eTxvLj9QtyO+RlSflmC3rHd0unVnqdiYJz5atBfjr37IjwwUlEwXDpIW6OCPZVaD
         lYvrtJlPVAPGenBb+mPJ6mE9OgNCeSjTsJUNqxs8S3XSGb1eGa4WBdZHi3+1IxI5rCPr
         Wc9A42ApUgvqmRYT9kIpd0TpG9Wzt3XwLxCiy69I/YS1QtCHIRmw5haaWpjSnPOZJ2h3
         o/GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ukDIQX9bL54lcOPlsmj443kr15HK+0ZSKFRYVUI4prs=;
        b=MAIhsAv8RzvrX7lLj9NTiMb1sGxlRIDO6edMNfUl93DIUXL6FPG11pt68zyq8l7msn
         iTrxhmHeiL7FlQcptZNVCMKKhhdo4SULYxQ3O4LrUdYEuXJZeZN0t5iYxmCCvE4qjzod
         8FB/d/rX4rnJ7hW0DVmhkcR4j6n2mmlaGXKYcA0jNF8nJKR6nTjHNNlOQ1w4BsCMG8IF
         2XK07iwUtZUg/jD6FMCDxdUliBMVvqGnbOcv7IPNgtKwMOqmblFo/4tGfXG/iQVPAJ2s
         9ifvqcOEqxVT5O/iEairnkjjGljuV6fe9OYVUTDl2rmG+AhT1y7Wsy7uMMFL+bPx0j60
         20Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ukDIQX9bL54lcOPlsmj443kr15HK+0ZSKFRYVUI4prs=;
        b=iadNEoAJkOPp5WI8nnU6xPZiFHjNx1sfQRr3AW5W90qszXoqgYtQYtLVUHMWCXwkvG
         Bk1/xWoDPk7VbWmxG0ZwYkd9fourVxU4n8DilMG5LHbn8QTRknjSw+2xXHTB62uXOuUK
         tY3zmScdCpgCg0acYS1d1/QEbVEmxG7MT+jEENJH7MFXVHVRX2PebQAq1O4EdFqCpHZy
         j/qZEvNaDvQfONdDIIsAo4p9oQ1nl8hfsBOQwiPwsMmnYZmkSZp2/VYpaB/1LRtvCwVJ
         2OimAYm7qsj/btRNStZfPqDW7yQrTfp/jN7a1axuNSqbLNPkqmtaLef3OgMHSixSh8yE
         n/0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3T6ilg8YU0RRRX2UVpHIV4KA1WxvpS9PpyQxAXVZ7FkOX+77p0
	bo1jb8j0yIPC3qq6uEpZBEw=
X-Google-Smtp-Source: ADFU+vsh8dJethGXwiQBw5Wb9bq7CwaljfnTgqv9d/QCH8sC8XQzLVGekdzewhxbo7N8P7G9EvqmlA==
X-Received: by 2002:a17:906:7715:: with SMTP id q21mr3340104ejm.45.1585147084395;
        Wed, 25 Mar 2020 07:38:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6bd2:: with SMTP id t18ls1128948ejs.7.gmail; Wed, 25
 Mar 2020 07:38:03 -0700 (PDT)
X-Received: by 2002:a17:906:960e:: with SMTP id s14mr3520353ejx.162.1585147083823;
        Wed, 25 Mar 2020 07:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585147083; cv=none;
        d=google.com; s=arc-20160816;
        b=wmsKMQgaaCnUOYx0RNTU8fVPkEQIQ3ids3SRrvNf/aGR9IuVsIkyD42bWQf01rJIAU
         ltqeXiZ4wZbqdmCxsK8kaZX6byh+ARhutDRV5Ifb5MQ6bBINpL1L6c/XPOrl0exsUiid
         btSgmlTNMSEDHaW1bm19jxXsYCbDL80VOLKXHQskFxvGB5S/iJ2QvW6470++p390dasi
         h1esHzv5o7WPZu5ivKYMqxfIAl5bppeeXs7NwX0Svx2WmIpLeToIbwbMbNizwlFBP68g
         STkOAx6XyK6NS4seTfiqJv7mGZVROqKC3vpy4n/KeKCrprUY/08qwzqTdvt5RusOm0ci
         YbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from;
        bh=Usfj1MHnm+2602/ET334vDR9tWBUvF//x98yMAW3DxY=;
        b=gEXfF1HZs3Cn6NhMVTC4treaJvirL5rkTSlvr24xFoFed+vpxMpxQzBTUqfxnIlERu
         Bb+GmHCUYBWuL2Li5fzEBRM6PBs2o48pbLMLd71vrMCS8fwAOqI2es5sLQjIfONwLQTV
         AbAROGBd/EO1XFbRKrIjeYRuLTKwmPP7089bJHaco67mAKIZm1SjI+hYeD8xHAKZ6qPm
         B9SnTnLnlO7xrN2jb3gsLqx8BsD/6q+QvSvQC+jYiKo/MssmrelRYZ7NUWBaq6fkziX3
         SAQzlC51NSPSr3+9vz1wMyjGNlPKyNH06PtcJYolTFjTHHGgql0hmqrUHSQQgWZnpVLz
         swFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id ck3si1205975edb.5.2020.03.25.07.38.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Mar 2020 07:38:03 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of tglx@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
	by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
	(Exim 4.80)
	(envelope-from <tglx@linutronix.de>)
	id 1jH7AI-0003iG-I4; Wed, 25 Mar 2020 15:37:54 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
	id ADD15100C51; Wed, 25 Mar 2020 15:37:53 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: hpa@zytor.com, Andrew Cooper <andrew.cooper3@citrix.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Jan Kiszka <jan.kiszka@siemens.com>, James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, Matthew Garrett <mjg59@google.com>, Josh Boyer <jwboyer@redhat.com>, Zhenzhong Duan <zhenzhong.duan@oracle.com>, Steve Wahl <steve.wahl@hpe.com>, Mike Travis <mike.travis@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Giovanni Gherdovich <ggherdovich@suse.cz>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Kees Cook <keescook@chromium.org>, Martin Molnar <martin.molnar.programming@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, jailhouse-dev@googlegroups.com
Subject: Re: [PATCH] x86/smpboot: Remove 486-isms from the modern AP boot path
In-Reply-To: <601E644A-B046-4030-B3BD-280ABF15BF53@zytor.com>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com> <601E644A-B046-4030-B3BD-280ABF15BF53@zytor.com>
Date: Wed, 25 Mar 2020 15:37:53 +0100
Message-ID: <87r1xgxzy6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
X-Original-Sender: tglx@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of tglx@linutronix.de designates
 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=tglx@linutronix.de
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

hpa@zytor.com writes:
> On March 25, 2020 3:14:31 AM PDT, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>@@ -1118,7 +1121,7 @@ static int do_boot_cpu(int apicid, int cpu,
>>struct task_struct *idle,
>> 		}
>> 	}
>> 
>>-	if (x86_platform.legacy.warm_reset) {
>>+	if (!APIC_INTEGRATED(boot_cpu_apic_version)) {
>> 		/*
>> 		 * Cleanup possible dangling ends...
>> 		 */
>
> We don't support SMP on 486 and haven't for a very long time. Is there
> any reason to retain that code at all?

Not that I'm aware off.

Thanks,

        tglx

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/87r1xgxzy6.fsf%40nanos.tec.linutronix.de.
