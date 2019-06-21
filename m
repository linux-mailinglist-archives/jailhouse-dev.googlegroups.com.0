Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBBWDWPUAKGQEO2J7Z2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC664E9F6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 15:54:15 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id p3sf1038350ljp.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 06:54:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561125255; cv=pass;
        d=google.com; s=arc-20160816;
        b=g+c4djPJRxIeWTC4D8hjnZcTlWbY0wOaiP40z3mTsL74cGIlejTvsx8XiWr5U/gRD+
         LGb7g/qpuDNM6tBFfSwT5hz9SksjlI21U3xwZX2SVEGA/vpKJsjsBC9v62YUUHhICHqP
         kw3zG2sOlE7w+P6ZA/KIFWkRN5nmQtFvUBhL/EqbGOZQMHVEJddP810hZYhMReWpXRs3
         Zmte42Yz8Ff4BlFA8KgKXac+GDtb0F5wFc+wFtpX/K6PK0ztmHTv+olm8yXLJazGYBfo
         HfKn6VMEXkffyHEqbcIXAv48k8dVs7SX1MZ0vn2F0FPo3T/8GC6M3EeLA0LN6pWeR1U1
         uGeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=J/XUccYdrEcMdcDCg9+zSHcuoVNj4wgNPZzvKU42u6M=;
        b=qQ63dFsp90apJOF7e1O8xC/AbCa+t43qJ7vksl/KS+qEapSXdZkWqCAlE8wKJKUJmd
         e7XU7yRu06r8aIGVGjozpxLtOU/jsYZQR+cr41Eol6jWsYA2WOnket/juWeJeG75nX/C
         P4ot8B2jvN99/74aaIVRjv5n5SBFQD/FRRVtJ4BVqnKl9j5oOegffOO+3CBuY874N5eR
         rR2nrrNN2+JkWKtrGPFCSjmHSdytJwFj3qErZEFQj4vir/ZMT31Scics3/jJI12G2ZQd
         XYdDSXQmhoswoJwSnQriaE9mxOXA9MEqY+SclrTFSfoISKQAcNyZTp3EXphm5jpkSjZR
         TdRQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J/XUccYdrEcMdcDCg9+zSHcuoVNj4wgNPZzvKU42u6M=;
        b=XL7oirmxWXsiVu0PnPLsLoUpIJLm9mDGK7CQG5YSFDZofB/7mBaUgC6ZBEUMfSULLe
         nrW0YQgBfrPNWXaDRRz9AMWs7xFub1FGXexgmBWKUFQdPSYPGKIRP7EvUxmjMDzWbReD
         DDfCU/Vl+9Z27XhPVWNOEZz77/fNA4JzndLxZicDKOG8CJZfn83O9T2DuWTBU3tLy0EJ
         2dW3LGG/0mF3zgHyZ1gbYqXLYIO0TgPKoqoJCDZVKEK4CnXD0qzkkMmhJYfb9BRzXVke
         Jp7kxpnIiX4yq+B3KadZjO7QR+/HzXoLWKV8adHpWY6DY7fMIAK67hF6XkvZIwX8wjmP
         ojbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J/XUccYdrEcMdcDCg9+zSHcuoVNj4wgNPZzvKU42u6M=;
        b=dox+WMwCdbPzBwufDf894cybB6NJKFkhaWsx2clwsLa8UXyrwrmvzezwmQPg1N+Y6+
         iN6QhtaCmCNt5GrTRGM/KzZMWbHny8+VkQ6q/oVqMpbcQbCHOEQygFw66r5yQbegbrjP
         X3V41C3Y1Au/D19cw/lvUEr/R6med9GpamJg0O1O0IRuY129W4vEbSnHFbTDHWINqRDe
         sFKhbvP0UwCzyZ672SzbU9+GkWzAFBJC3FNdP90f6OuY4KSP76lavGUJrZQWip5K73Ck
         zsAV8FZlxcjsxhXKg/woKSsf4nglppztvTNZ6A4EflrdyWijrZSAO+E6DW1cK+FySpSO
         xxDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXMzrDrLoY6kgApf/EYTvcNTkNawJZmrG2JUyt+CtfeedicLJHh
	sV8Jeo68vK+inmq/9DEHm/U=
X-Google-Smtp-Source: APXvYqyBR6EI/Yji+72hZoZHtzbOVxnp2QoS9M65D89EEuvnMRXI/Y9/831cfMmMFyu9VSrbmJdP3w==
X-Received: by 2002:a19:ccc6:: with SMTP id c189mr36554142lfg.160.1561125255367;
        Fri, 21 Jun 2019 06:54:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:998e:: with SMTP id w14ls1083031lji.0.gmail; Fri, 21 Jun
 2019 06:54:14 -0700 (PDT)
X-Received: by 2002:a2e:12c8:: with SMTP id 69mr61892143ljs.189.1561125254150;
        Fri, 21 Jun 2019 06:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561125254; cv=none;
        d=google.com; s=arc-20160816;
        b=IpRorXolC+zOMueA3YvF02o9YZfIwfteyiF+UrHjUJ4S/EdtiEiOMQyn3u0Ey8z4+N
         Md8PdYZwY33uUSXIzed76G/sC2lmaNtpBpK5lu/D3xwnPFPf4YypN6xqy654kT2NwyFT
         n7u6amyn4d6TWum7mh4HiBY/7Ua8vziTQSPM2R3bFOvjw82rh+8T/gQuf8TGQT/FgfT7
         Uu7W9R23bGa27ABsszJS4aKjaJhdcU794D7msxXCFg60NBOiEWiWXlSPCKgFDeXhmjCT
         UTpCoG0tEOoIh+2SRBM4Lhhsz94520uadDCB1Y1lrPRIig2mTD/IBgUiMaqSo+PDeUsO
         Zz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=jevTk0a00MlzLC6FivGOf2qtUTgspbcrYhpyvEzoNsg=;
        b=rN8dueiILG6tbeqo9YX/0xWBG7pUDY01ED/r8PHyK/eB7M+3kHdc7RLkrKjy1b0Rc8
         MkY2C4TJhBBMl0IW493lN40agu0uoBYziClKfysQ46M9fQ73u/za5bOMn7aUxdwL8QXU
         aDOZlq3+qCuabe3AwIo4doOmFMZPj89cQQMWCH5Q96KAJxL6NxkrxNrjNblmY3AJ3tnO
         dEGpCSnL+QQ4K/Qsbik1RxgDPJOHhgJqwL3UIZ044Me4Z6IQTJplMbJ2X8ras/wf0feP
         XvhFrYqnCl10/+DSCgFBdyaYz62tZUgv3hFL/b/ilqO1zNa8ldOAIzvUxT2zgnYdJMUP
         fIAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id v29si182095lfq.2.2019.06.21.06.54.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 06:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5LDsC8W014922
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Jun 2019 15:54:12 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.132.36])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5LDsAjM028834;
	Fri, 21 Jun 2019 15:54:11 +0200
Date: Fri, 21 Jun 2019 15:54:06 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Valentine Sinitsyn <valentine.sinitsyn@gmail.com>,
        <jailhouse-dev@googlegroups.com>
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
Message-ID: <20190621155406.18df2751@md1za8fc.ad001.siemens.net>
In-Reply-To: <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
	<ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
	<b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Am Fri, 21 Jun 2019 14:51:30 +0200
schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:

> Hi,
> 
> On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:
> > Hi Adam,
> > 
> > On 21.06.2019 17:16, Adam Przybylski wrote:  
> >> Dear Jailhouse Community,
> >>
> >> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
> >> Processor. Unfortunately the system hangs after I execute
> >> "jailhouse enable sysconfig.cell".
> >>
> >> Do you have any hint how to debug and instrument this issue?
> >>
> >> Any kind of help is appreciated.
> >>
> >> Attached you can find the jailhouse logs, processor info, and
> >> sysconfig.c.
> >>
> >> Looking forward to hear from you.  
> > I'd say the following line is the culprit:
> >   
> >> FATAL: Invalid PIO read, port: 814 size: 1  
> 
> Could you please attach /proc/ioports? This will tell us the secret
> behind Port 814.

Not always, the driver doing that has to be so friendly to register the
region.

> > 
> > As a quick fix, you may grant your root cell access to all I/O
> > ports and see if it helps.  
> 
> Allowing access will suppress the symptoms, yet we should investigate
> its cause. Depending on the semantics of Port 819, to allow access
> might have unintended side effects.
> 
> You could also try to disassemble your kernel (objdump -d vmlinux) and
> check what function hides behind the instruction pointer at the moment
> of the crash 0xffffffffa4ac3114.

A look in the System.map can also answer that question. On a distro
that will be ready to read somewhere in /boot/.

Henning

>   Ralf
> 
> > 
> > Best,
> > Valentine
> >   
> >>
> >> Kind regards,
> >> Adam Przybylski
> >>  
> >   
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190621155406.18df2751%40md1za8fc.ad001.siemens.net.
For more options, visit https://groups.google.com/d/optout.
