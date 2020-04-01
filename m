Return-Path: <jailhouse-dev+bncBCXKBPVPXAFRB7FMSL2AKGQEIQGPSAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-f61.google.com (mail-lf1-f61.google.com [209.85.167.61])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630119ACCE
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 15:26:21 +0200 (CEST)
Received: by mail-lf1-f61.google.com with SMTP id c20sf10179596lfh.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Apr 2020 06:26:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585747580; cv=pass;
        d=google.com; s=arc-20160816;
        b=0H/1nrTCDToSOOisdD+gKpBGwkIpo59XwCMfn8vKQbX0KSm7R/mcgDSRJNklAO8zVD
         XNVyXyhDFj1Cy4vL7SMZZcteVkREMsG/yqHjFCci/XSE46fzW1u2BwU884RyAFIRcLYd
         ZtXyWW/3r1dkHhxZ5+PCa/wXhZeLiMWtuCjJEz9tbuQ8QajwSr3uENFZpY+3NNDqnaBT
         Mw00NWiIaDcc/LWAD5dvsQDjcfGDx57ovHDwrzu2GDyrVWXWZJEEXRbKbqyqiIvYk/VN
         GlPoNTKrmxMe1rOnoMsb7wa/lhx17+amSqX+gKu4BeUKBmi5+/LAbVG1M4BN0LQrUT6n
         Ibkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:message-id
         :in-reply-to:subject:cc:to:from:sender:date;
        bh=J+NrraTexOu32ljWlw4h+94SNS7NB4P9EietmBHM4bE=;
        b=Z9fWTLhdJnlpWHZqcOMdWI5Ac/4CBOR3uV7WHPZxND2p7VeX4n0/b91uDynsD1iw4G
         +8GNx7aW09etrTPl66Xzt5CdSYa6lqzR9SdUsJdZRRKdpvOAAoWxQJXhoj9WpsB8sRkD
         Gw8jf3scMIA0kdLjdmlgQi2p3nQUOHpBwYw5GXPeQKG/tAlkIks9qLJ/2eMOyAwpbHtv
         T9eWZQe9IK4+ZG9bNO38XELs24DW4tUiCaRN2KhNMYfZAgryut6F0gcEA9iMvv9Gu6To
         7ZkF8go4zuTzXfJjMIedygPJnqZj14kMBE9pBuH8r2QjJQNZ7fglASWsK8DUtemkfy/h
         Soyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of macro@linux-mips.org designates 148.251.95.138 as permitted sender) smtp.mailfrom=macro@linux-mips.org
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:sender:from:to:cc:subject:in-reply-to
         :message-id:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=J+NrraTexOu32ljWlw4h+94SNS7NB4P9EietmBHM4bE=;
        b=WljPK1IXcRlrzvMI+9MHOP189lci/42hwIysq8T6JDyYHy36ObYqmL+bWLMnbweXgC
         j6hpPsc7j30pZd97LtoA9sYNGLdb3/ozaOv+eSWmgZYxmfa4aBSmND7z5XiRllOTItQo
         RsE0h9GPuAH6FIP/scWEwYN69LXgEoowJco1fXGRQHvg9LzQT/fQWruu1sxhFa5fnCtp
         Qc/vzqw35TyHM05izyjJ9PUZBnzUGYeF7juxXvKKB9wa/pQCaAeUrxa0rV4mmS22LXGS
         PnS2HmxFOFco1XsYjW/4ozBrkbTWKuqMWwc579UepCMu2zkg3PyFLS5tXvS8SW1Y/+Q2
         2jrg==
X-Gm-Message-State: AGi0PuawphF/RGaExIXBCHDDcDsYVIfs8RvCEEW+IhfOowsAWEzOjbM/
	p7XqUABfb3NdMzslZKaTcc8=
X-Google-Smtp-Source: APiQypJ2qBX9bGsHtM4BVLXyyNyQGUWCR9O+j+RUWGNsBAwePi9c+v//cAfmbGoV9SSicxVn7N9QFg==
X-Received: by 2002:a2e:8911:: with SMTP id d17mr13383043lji.16.1585747580568;
        Wed, 01 Apr 2020 06:26:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7017:: with SMTP id l23ls5391226ljc.9.gmail; Wed, 01 Apr
 2020 06:26:19 -0700 (PDT)
X-Received: by 2002:a2e:3a19:: with SMTP id h25mr4418873lja.133.1585747579757;
        Wed, 01 Apr 2020 06:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585747579; cv=none;
        d=google.com; s=arc-20160816;
        b=BA7rHS1ifm/AVT7In/N8RK4vSxJLRKkAtK3Qgbu1DxK2xer0N0Jw1znoevVWwidgxO
         Acj18i/lhUwe1PTJytjxR2JBZb5dpt+G8jZ3a2suUkjKxbWSItmR7jsAY3FF2pQKSHkP
         Ci0ilJbZ58n+kiWF+l6ljtzLcDl2xqPKrvw39RDnpev+yly/1WGG+2TgLIqkNJx7UFh+
         ioPeDhnppLoxSI0+BW1eRgO+8eMrjH5ftG2KIr3DhhjVrK28x2xZRAkon8p9dJ4s/3uK
         w+VE0rFG+5c8RLTxztg/2GjSyoRUJozapaFQkhTtKTG4ZWDlcJNdfZzHVKR/5Ip31Ha+
         UdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :sender:date;
        bh=gn0gMMvY+flUfYWqYy8QjJkFzSvzEw90kbfFcUTtZCc=;
        b=bVpH6IWIMEmw4oiZVYNZAJCxTsBCR9bmzJInZNUoxoHv+zeijAoKPOjdPxXbkl7mbo
         Yvv3MkpmA2/6lgo0rorka2uuHEfuUopzOTOc6bN+/049eDnGvMwlwhkUJAVMhwqYEpjW
         injRiS9JzCF0N8z8EnFd7sK2tkw0+GhkljDTGoU7p+R7kigKSumbBmTjaCM97eRDFKuz
         sP7czWxoD09uGO3uB6Bg3mrC+IAMlUsVCcKXnuLvuZ84EkyZRM6hRW0NeDK/MGXQPreE
         Q5gxS4hKqEKPAHHMP4DjEPS0MI7HyRv8IsJX5Fcu9JWwJMZc5KoLNyYOqcbSPnJ0Ok9x
         cIjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of macro@linux-mips.org designates 148.251.95.138 as permitted sender) smtp.mailfrom=macro@linux-mips.org
Received: from cvs.linux-mips.org (eddie.linux-mips.org. [148.251.95.138])
        by gmr-mx.google.com with ESMTP id s22si118538ljp.0.2020.04.01.06.26.19
        for <jailhouse-dev@googlegroups.com>;
        Wed, 01 Apr 2020 06:26:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of macro@linux-mips.org designates 148.251.95.138 as permitted sender) client-ip=148.251.95.138;
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992512AbgDAN0QR3HMl (ORCPT
        <rfc822;jailhouse-dev@googlegroups.com>);
        Wed, 1 Apr 2020 15:26:16 +0200
Date: Wed, 1 Apr 2020 14:26:16 +0100 (BST)
Sender: "Maciej W. Rozycki" <macro@linux-mips.org>
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: David Laight <David.Laight@ACULAB.COM>
cc: Thomas Gleixner <tglx@linutronix.de>,
        "hpa@zytor.com" <hpa@zytor.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "x86@kernel.org" <x86@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
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
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH] x86/smpboot: Remove 486-isms from the modern AP boot
 path
In-Reply-To: <23147db6f0c548259357babfc22a87d3@AcuMS.aculab.com>
Message-ID: <alpine.LFD.2.21.2004011354050.3939520@eddie.linux-mips.org>
References: <20200325101431.12341-1-andrew.cooper3@citrix.com> <601E644A-B046-4030-B3BD-280ABF15BF53@zytor.com> <87r1xgxzy6.fsf@nanos.tec.linutronix.de> <alpine.LFD.2.21.2004010001460.3939520@eddie.linux-mips.org>
 <23147db6f0c548259357babfc22a87d3@AcuMS.aculab.com>
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

On Wed, 1 Apr 2020, David Laight wrote:

> >  Even though we supported them by spec I believe we never actually ran MP
> > on any 486 SMP system (Alan Cox might be able to straighten me out on
> > this); none that I know of implemented the MPS even though actual hardware
> > might have used the APIC architecture.  Compaq had its competing solution
> > for 486 and newer SMP, actually deployed, the name of which I long forgot.
> > We never supported it due to the lack of documentation combined with the
> > lack of enough incentive for someone to reverse-engineer it.
> 
> I also remember one of those Compaq dual 486 boxes.
> We must have has SVR4/Unixware running on it.
> 
> I suspect that any such systems would also be too slow and not have
> enough memory to actually run anything recent.

 For reasons mentioned above I cannot speak about 486 SMP systems.

 However I have a nice Dolch PAC 60 machine, which is a somewhat rugged 
luggable computer with an embedded LCD display and a detachable keyboard, 
built around a pure EISA 486 baseboard (wiring to an external display is 
also supported).  Its original purpose was an FDDI network sniffer with a 
DOS application meant to assist a field engineer with fault isolation, and 
as you may know FDDI used to have rings up to ~100km/60mi in length, so 
people often had to travel quite a distance to get a problem tracked down.

 It used to boot current Linux with somewhat dated userland until its PSU, 
an industrial unit, failed a couple years back, taking the hard disk with 
itself due to an overvoltage condition (its +12V output went up to +18V).  
I failed to repair the PSU (I suspect a fault in the transformer causing 
its windings to short-circuit intermittently, and only the +5V output is 
regulated with the remaining ones expected to maintain fixed correlation), 
which the box has been designed around, making it difficult to be replaced 
with a different PSU.

 However I have since managed to track down and install a compatible 
replacement PSU from the same manufacturer whose only difference are 
slightly higher power ratings, and I have a replacement hard disk for it 
too, so I plan to get it back in service soon.

 With 16MiB originally installed the machine is somewhat little usable 
with current Linux indeed, however the baseboard supports up to 512MiB of 
RAM and suitable modules are still available for purchase, even brand new 
ones.  Once expanded so that constant swapping stops I expect the machine 
to perform quite well, as the performance of the CPU/RAM didn't seem to be 
a problem with this machine.  We actually keep supporting slower systems 
in the non-x86 ports.

 And as I say, the userland is not (much of) our business and can be 
matched to actual hardware; not everyone needs a heavyweight graphical 
environment with all the bells and whistles burning machine cycles.

 Again, FWIW,

  Maciej

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/alpine.LFD.2.21.2004011354050.3939520%40eddie.linux-mips.org.
