Return-Path: <jailhouse-dev+bncBCXKBPVPXAFRBE6JST2AKGQESJ5676Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-f56.google.com (mail-wm1-f56.google.com [209.85.128.56])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF419B8F9
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Apr 2020 01:32:35 +0200 (CEST)
Received: by mail-wm1-f56.google.com with SMTP id z24sf445573wml.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Apr 2020 16:32:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585783955; cv=pass;
        d=google.com; s=arc-20160816;
        b=yNnqdRU1dF2zsYlMmaF6iKm1CuUwjIBOYnfI1IrxcvU2PuQeJuO23h8l1vJF5XS/lw
         uxsqSo+iDW80Da1oMuuQNybSokdVZp09xOUex0eaTaY5nCgW2qQA0cMi7y9Ho+O6eR2a
         srUhYco/Rhpj5+ohvaLX142R6iA9hcwEr6pBNIOnWBr15ouOcVlP/bwgshH8wiqxZnlZ
         4Ak3B0ZgP8kNfbaHt2atrZVj755qArQEe25gnW9fQdSbgOKTVHxPdqk9QkeDZxCH8r7Z
         5H6iSK0y9r8dP2GV8x33b0p5JFaIifu9LjI1mFvQ9VLmfrCZ1gO25uNTnlogwjJj2+cZ
         q3rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :sender:date;
        bh=cLJDYLJnOskqjPOlWoR5WGMpGPGAx2Snh8pDojgZNCk=;
        b=Mudt3bX6e0ajcWrYQ+l0AykW0dgTNCASnK85aXNIrI96EdTtVWP2+wtNgmB9BmbbHl
         CYOVjEL6nxohywx6XqcI/R2rHYqxJILBcFgixTImqDZhZGnZ/cmJgGP9+CMtjvAIa2XP
         OnsT/u03Hln7ndwUod3KcyH3LxnhTyiFfx8EQF1KJxawkqTjnAMDP+9Tfof+BruWTp4Z
         YssQakajXXWkK+jpyjgnj8vZHf/tAVHHycEyhbILvbzMHvNZ1GRUz4vjSZRVz2Yfv5+/
         SfDjtE7WY7Cmy8DoPkIAA80SF0Uk0vC68NNGx9ZD0kBljD8+C0Lf0T6igJDl7wtbAJFg
         Qxkg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of macro@linux-mips.org designates 148.251.95.138 as permitted sender) smtp.mailfrom=macro@linux-mips.org
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:sender:from:to:cc:subject:in-reply-to
         :message-id:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cLJDYLJnOskqjPOlWoR5WGMpGPGAx2Snh8pDojgZNCk=;
        b=U5wVtu46MnPnjTTqYxw66aA/3gYY1OTP9cyMNdMwjOfNM/jhOtvEwm/LPDbmoRjnSI
         ccik63kyByLV6kfeANZ0SuHFeJ2FGuO1CJmA6T01htDIJ5IoGSMk0/mGWvK/8Zi9QtAN
         iJG4w2HD78pkR4omgPDK+TKPE6a6rqNrvsjMBDl4ov6UjRQTT5hrNVirkv90/Hhzc3P5
         xbK1Je2WHYsiW2GioAlcruImJ6+vhOqQGYO4Zbkw6CxPiDgEdjYXBffsSENskXs4VYjb
         pgSACur4PLwfXmm36oK1GKDepkTekenIKBGTZ+LDHTlt7GaEfHBR5fWvGcd4tp/3f2XK
         8mxQ==
X-Gm-Message-State: AGi0PuYy1J9pi9+EW6Jt4/DeUDZa74ZJkO0/a9WIpA3EnC+Mq9z30tai
	0u11sRLY5vFOSRTuHXllZpE=
X-Google-Smtp-Source: APiQypKsMT48/4+HFZuciWKZgpF/CEJK66nykdqqreje0F37A4yJzDVe3gwQgfdSCfAlvOwnF8UDdg==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr416237wmj.180.1585783955467;
        Wed, 01 Apr 2020 16:32:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9781:: with SMTP id s1ls315063wrb.2.gmail; Wed, 01 Apr
 2020 16:32:34 -0700 (PDT)
X-Received: by 2002:adf:a3db:: with SMTP id m27mr408349wrb.350.1585783954754;
        Wed, 01 Apr 2020 16:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585783954; cv=none;
        d=google.com; s=arc-20160816;
        b=ihB6eZMDLq1l0wlIJdTd6SEolPkK4ryKIFtkIauaFr+e3twRyy+bBum7a+pU1bt0E3
         PVNsI0TrRdnSvxzpcDPmy5j4jPFkOCoAWrWdyj0FqVPn2lUE1BoezYN6NZqZAox68v+O
         ydbmtopmn2/hB98KwpVC713slQff3NFEQhe+s8Vj09PK9KGw2yEu/jjVj+csq0gtKjz6
         L6P6PFDp7QwXyB6x+ZbrpyWfkuJJkg2pWluspiwoHTdUqdZiBM0jGRQLmYLmjQOlNxt5
         041rh8Cri68J8tgJvVuExMbHvbNM5XqjwfMlCfbEpOPulvgat3fnQhxdQj6CAjxmSMp0
         8BPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:message-id
         :in-reply-to:subject:cc:to:from:sender:date;
        bh=GJ3Xc4R2NLYeBfaPQ5+20lVgXh+vzZg3OnqLAl+W20Q=;
        b=AuTMgdEg+8zt/evXudXjypqREvnm8KaFTEl6CNzOWGqRmJ/bc9f6WuZkx0TcT/CVyT
         j0vP0mQTx02mH/DYH2krxvMYlv8tmVz7LZ7rPud7TqrhCwZD0gIJiOrvzquqAg30N7TU
         bSXmDZ4bGGQCxYQXs0cYboP+p+icmAbX/oSUTh0SgcO233JvTbgp0LTLdC/LOkrt5Jng
         idm3wdrKNsQ3Ue9urvbIIB5zkAMFw7wfP0+SObVbNv6egbNK4hFb7Sabk+6FjcsogGDI
         KpPM/yd0wR+hTr5fmhVhso7t7Y1mxi/9Pz9c2eKigHLprvEJP7fS7PYd3jGCbkF8O7qX
         W47Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of macro@linux-mips.org designates 148.251.95.138 as permitted sender) smtp.mailfrom=macro@linux-mips.org
Received: from cvs.linux-mips.org (eddie.linux-mips.org. [148.251.95.138])
        by gmr-mx.google.com with ESMTP id v12si166519wrp.5.2020.04.01.16.32.34
        for <jailhouse-dev@googlegroups.com>;
        Wed, 01 Apr 2020 16:32:34 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of macro@linux-mips.org designates 148.251.95.138 as permitted sender) client-ip=148.251.95.138;
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23993316AbgDAXcamxzAZ (ORCPT
        <rfc822;jailhouse-dev@googlegroups.com>);
        Thu, 2 Apr 2020 01:32:30 +0200
Date: Thu, 2 Apr 2020 00:32:30 +0100 (BST)
Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Thomas Gleixner <tglx@linutronix.de>, hpa@zytor.com,
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
In-Reply-To: <beefca46-ac7c-374b-e80a-4e7c3af2eb2b@citrix.com>
Message-ID: <alpine.LFD.2.21.2004012353100.4156324@eddie.linux-mips.org>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com> <601E644A-B046-4030-B3BD-280ABF15BF53@zytor.com> <87r1xgxzy6.fsf@nanos.tec.linutronix.de> <alpine.LFD.2.21.2004010001460.3939520@eddie.linux-mips.org>
 <beefca46-ac7c-374b-e80a-4e7c3af2eb2b@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 1 Apr 2020, Andrew Cooper wrote:

> >  Even though we supported them by spec I believe we never actually ran =
MP=20
> > on any 486 SMP system (Alan Cox might be able to straighten me out on=
=20
> > this); none that I know of implemented the MPS even though actual hardw=
are=20
> > might have used the APIC architecture.  Compaq had its competing soluti=
on=20
> > for 486 and newer SMP, actually deployed, the name of which I long forg=
ot. =20
> > We never supported it due to the lack of documentation combined with th=
e=20
> > lack of enough incentive for someone to reverse-engineer it.
>=20
> :)
>=20
> I chose "486-ism" based on what the MP spec said about external vs
> integrated Local APICs.=C2=A0 I can't claim to have any experience of tho=
se days.

 The spec is quite clear about the use of discrete APICs actually:

"5.1 Discrete APIC Configurations

"   Figure 5-1 shows the default configuration for systems that use the=20
    discrete 82489 APIC.  The Intel486 processor is shown as an example;=20
    however, this configuration can also employ Pentium processors.  In=20
    Pentium processor systems, PRST is connected to INIT instead of to=20
    RESET."

:)  And if in the way the internal local APIC in P54C processors can be
permanently disabled (causing it not to be reported in CPUID flags) via a=
=20
reset strap, e.g. to support an unusual configuration.

 As I recall the integrated APIC would in principle support SMP configs=20
beyond dual (the inter-APIC bus was serial at the time and supported 15=20
APIC IDs with the P54C), but at the time the P54C processor was released=20
the only compatible I/O APICs were available as a part of Intel PCI south=
=20
bridges (the 82375EB/SB ESC and the 82379AB SIO.A).  Those chips were not=
=20
necessarily compatible with whatever custom chipset was developed to=20
support e.g. a quad-SMP P54C system.  Or there were political reasons=20
preventing them from being used.

 Then the 82489DX used an incompatible protocol (supporting 254 APIC IDs=20
among others, and as I recall the serial bus had a different number of=20
wires even), so it couldn't be mixed with integrated local APICs.  That's=
=20
why discrete APICs were sometimes used even with P54C processors.

 And the 82093AA standalone I/O APIC was only introduced a few years=20
later, along with the Intel HX (Triton II) SMP chipset.  I still have a=20
nice working machine equipped with this chipset and dual P55C processors=20
@233MHz.  Even the original CPU fans are going strong. :)  Its MP table is=
=20
however buggy and difficult to work with if the I/O APIC is to be used,=20
especially if PCI-PCI bridges are involved (there's none onboard, but you=
=20
can have these easily in multiple quantities on option cards nowadays).

  Maciej

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/alpine.LFD.2.21.2004012353100.4156324%40eddie.linux-mips.org.
