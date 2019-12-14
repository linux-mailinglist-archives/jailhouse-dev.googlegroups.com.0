Return-Path: <jailhouse-dev+bncBCVKRBX6ZUARBMXB2LXQKGQEJUOCDPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99011F13B
	for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Dec 2019 10:51:48 +0100 (CET)
Received: by mail-yb1-xb3a.google.com with SMTP id 132sf1982485ybd.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Dec 2019 01:51:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576317107; cv=pass;
        d=google.com; s=arc-20160816;
        b=pQhdYzyaIXExp9f9ElESSzRDdQI6+OCVXx/+rJdkEIH1px4YcJ/XXaMkfBcR8PN8QE
         9BrpQqAg+FvSSz2yUYcJFGPnFO+Tx02d/N7lOQuGZx2NVKThVBoks7tAOZ63z6WV1HxW
         6rw9o7TzJXOplB9Zm18cnnTTkcfpA8pHfVwJ3qMqK3IA2kqfhDljZLcAKsFgkVItRgp9
         hDsVK0HXEobXiF7iF4vEUFjzf4zXYbyYQJXDLoaPxZScN92P/0rKUqo2w6Ju1Djf4yJB
         +QvPu6NgHy+VMftwMrvkfe/UNqmku41yy8dC6J+9HP+Xyd2vHYcfj7fzv8GwARbzRzQd
         TVCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=hv0O8QU5TY8fMpt6dpbGMNaX/q7gKpm/6zRg+3cdVTE=;
        b=pFJRqrzR4keeEVsXgI1hh1wetDSL2anqmlVornu1aUV9/6ojpSQ3fDWjzn1ILmlhKx
         ssz4ZbFVXruiHcZPADL5WhbQVmOyTirBQHqF7IZAmJ8aVkX1agWkg8dCg0tOlY6qkNFd
         ku5CsgyBczBB0ueTCDK6Mqsvzzl/LWuo6ZhtRhCSEh2//Xhz8T83ymC0bFYARdrlByCT
         eiqkuB11++E1KZdh+fDLhLsoUq2Z9aS1yD7a9LwFPBmZRI0qnd5lqBT/dbwzC+ytEAt5
         A3ZBIZZ2MbtHEJ5p6nK2L3vOu62p6CxszDkqbvpqteKNc1m0wYbS6WkoKzwK/ySsVIfq
         aoow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ur+Xcnma;
       spf=pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::32c as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hv0O8QU5TY8fMpt6dpbGMNaX/q7gKpm/6zRg+3cdVTE=;
        b=Wy00Owr6y09HIJgZKcHfztWJfOlbyvJ33+Cvj7Wb1gAjfhH/sJP4X2pXiXe4aHRoPI
         AqcOsmDV7juWHGCROjBL3oQY9sD7VOmo18dIgpwl4iPcID17OR++umrPVXNop7fVYc/N
         cy0d3AixZFcHYkzlKcThYcZhbnM455VB/BZL9DLxjx035L2J/Ai/t+KiZ7pw5lDLrFKM
         jZAvvjSsXb1ZPveKQDkAvOpFo7JtwBZfp52f2IXnt3Iq7SiW9gb8kJB6mPp24UDZQCqT
         DGsAXGWTZ5/Ev6hPRSaq/PBPfvdw5Vb+xeHNmR7t3SgU06lWf1q184u4gBG1fTtrXaWe
         /zWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hv0O8QU5TY8fMpt6dpbGMNaX/q7gKpm/6zRg+3cdVTE=;
        b=rnLFKkNUR/R+sNc4gpDJVaCa/BS/Yu4Yu/3EMTzN7xC85zqT/AmFmmp9pL38HsATG4
         yXgbGAhika9eyu2SfGstxY8RySuycBuy/3WL5jyLH6FU599s8DU18YYhv0Tpj+ty0IpT
         EVHYj37VY0jK2uttOyVqpd8d3MnGHsuiHbe4xk7MnuzgFF8OfH3pe6+RUWy6mfa9vNYk
         ngAjq8FIrDr7tVb58ophW1dLi2WjZwCGscZtBwD87Wf3sSYdkODFA/CI+omXzoyu3HIP
         mvv9Dfo6xE64IMY7ndFId6TnYJN57u7ZymX8lZUsv6j5/u4NihxIeNa6Dgun542hXG0/
         Qfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hv0O8QU5TY8fMpt6dpbGMNaX/q7gKpm/6zRg+3cdVTE=;
        b=U/7GK2X80ok1t2Trbbl3QhUrR7kKIHI20YAGCyO+f1WNEutPHJxSLCPdnIK6+pmOHt
         34c8WeWEmZr2ptc7l20yrs7RqFFrG9GF5MYInpCcTOmYMLcrRgqha+rPAY5cJE5RREcv
         XfoRlTUcDcYJfvomgosddvc1Ybzp9s1Gb7IXutSR270yeMOMsSJENL9stQXyoL6FstAv
         eSnldNyfYZMxP2lczoWm2K18KkEuUdo8/9h1wycq+cRgBQG0+cIeoaE2ghpUhcqlCdcA
         zZzkwrk0XM0IVnHzz1TGslm9PIL2ZrMDjDsBRvwM4qxivPNKya0SCY4xLlKymh16U3J5
         00gQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNejIf5tIFAE7XYRYKWg/2jC9Wpe/BCRJRZMuEOQW1A4SYofE/
	U/ydi0Vim2zSjndvT3owb64=
X-Google-Smtp-Source: APXvYqzqVTF0MIusVv//qXq6NYUYF2dXKF9JyQD1GTVqWZ82GN+ReKO0jNsvuotd2JILMyTs3AMvNg==
X-Received: by 2002:a25:c903:: with SMTP id z3mr11359910ybf.249.1576317107031;
        Sat, 14 Dec 2019 01:51:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:2e94:: with SMTP id u142ls1721982ywu.11.gmail; Sat, 14
 Dec 2019 01:51:46 -0800 (PST)
X-Received: by 2002:a81:5dc1:: with SMTP id r184mr12267212ywb.433.1576317106384;
        Sat, 14 Dec 2019 01:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576317106; cv=none;
        d=google.com; s=arc-20160816;
        b=gjE2E2aXhC5Z98oorcRArg4PtAApcOTqdl5r1SDlGy3WQZ9RQ201uwFnYwrloGfHEC
         6ipXVWOyjeGXV5ovTTKv0c03cvqyHpn+EzIrSxj7m+0p+YioGnNc0Fe4l57pUwuj/B2U
         ghg7Ooo8uEWqMGlrOp/JiqSYnXQrvrNV+MX7H82kDcYRe1tJ6ChhM0cMRlhtICYzsaU+
         p62LTIy4M/vAEVSfrvnevJiFsDioBDrUTfaUGTiVBSUoi+QzDkHQMhD4ocGAWuNCSD+r
         X/HJRTeDRy/uU/3BU2WMAbLGGZf6vjPcFhaVdjThLFNDnS+srgyX/xI15C2dJl3GWQ8u
         /8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zt51I8zIrIPC33bqFMj60C30zvZYORFqfl5vQEJB3X8=;
        b=VyWpZ89KMdbvlXiCkmBowC1USbZ+rHDwndmEOCFTVxMmw1IpZF+vKc7NazpiAommGo
         PSfdAZhICI9bufWOVp1nZwFk64zoDFmC+9Zz/UsKO47J6AjsEJUHD/WG6g/SyVwN4azU
         oebkX/wP/a+kFBht80rILNXZp1qJiJQVxaCq+ys7cIhoUBOWHfgSzMTAynL/zQZo9r9z
         nyCScw3juj0v+wbseNDX76rtljD/XKSFp/W2Aofc+Gn/bS+HDwoVEA6h2INGJbuk9XQt
         Pc483wGZZcvPkc7jQPdDYymX0ZxsV8UtE5W7j8I4621h+agTCX1KETdJqsCcS8N+FpT0
         BYnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ur+Xcnma;
       spf=pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::32c as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com. [2607:f8b0:4864:20::32c])
        by gmr-mx.google.com with ESMTPS id s64si607176ywf.0.2019.12.14.01.51.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2019 01:51:46 -0800 (PST)
Received-SPF: pass (google.com: domain of manivannanece23@gmail.com designates 2607:f8b0:4864:20::32c as permitted sender) client-ip=2607:f8b0:4864:20::32c;
Received: by mail-ot1-x32c.google.com with SMTP id p8so2302190oth.10
        for <jailhouse-dev@googlegroups.com>; Sat, 14 Dec 2019 01:51:46 -0800 (PST)
X-Received: by 2002:a9d:7357:: with SMTP id l23mr18845164otk.10.1576317105160;
 Sat, 14 Dec 2019 01:51:45 -0800 (PST)
MIME-Version: 1.0
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
 <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com> <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
 <87131459-2a1d-91b5-21f5-3dfccd49fa81@siemens.com> <CANBTL1XSjDtz5OFuMUXSM0R_=nsESgHH1WFxRk9qaA2uCy0Jww@mail.gmail.com>
 <0660d2b8-b8e4-fcf2-69cf-068b9fc4a622@siemens.com> <a27fdb7b-0c85-d967-7c8c-81d26b0157b6@siemens.com>
 <CANBTL1XAj0ArLDjNq_2rfu8NXCp9h5i=atzhP8m2BCEhLtRVCg@mail.gmail.com> <0c7b7542-5f48-8f77-128e-26eee1f24ad7@siemens.com>
In-Reply-To: <0c7b7542-5f48-8f77-128e-26eee1f24ad7@siemens.com>
From: Mani Sadhasivam <manivannanece23@gmail.com>
Date: Sat, 14 Dec 2019 15:21:26 +0530
Message-ID: <CANBTL1XmekrVLi+AfTT7oM9tZjNUcOd-7TM8KeeEH6TLSd-b0A@mail.gmail.com>
Subject: Re: Zephyr as a Jailhouse inmate
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, Peng Fan <peng.fan@nxp.com>
Content-Type: multipart/alternative; boundary="0000000000001b47db0599a6ede7"
X-Original-Sender: manivannanece23@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ur+Xcnma;       spf=pass
 (google.com: domain of manivannanece23@gmail.com designates
 2607:f8b0:4864:20::32c as permitted sender) smtp.mailfrom=manivannanece23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000001b47db0599a6ede7
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Dec, 2019, 1:39 PM Jan Kiszka, <jan.kiszka@siemens.com> wrote:

> On 05.12.19 20:32, Mani Sadhasivam wrote:
> > Hi Jan,
> >
> > On Thu, Dec 5, 2019 at 1:38 PM Jan Kiszka <jan.kiszka@siemens.com
> > <mailto:jan.kiszka@siemens.com>> wrote:
> >
> >     [re-adding the mailing list]
> >
> >     On 05.12.19 09:07, Jan Kiszka wrote:
> >     > On 05.12.19 08:49, Mani Sadhasivam wrote:
> >     >>
> >     >>
> >     >> On Thu, Dec 5, 2019 at 1:09 PM Jan Kiszka <jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>
> >     >> <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>>
> >     wrote:
> >     >>
> >     >>     On 05.12.19 08:14, Mani Sadhasivam wrote:
> >     >>     > Hi Jan,
> >     >>     >
> >     >>     > On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka
> >     <jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>
> >     >>     <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com
> >>
> >     >>     > <mailto:jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com> <mailto:jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>>>>
> >     >>     wrote:
> >     >>     >
> >     >>     >     On 02.12.19 19:43, Manivannan Sadhasivam wrote:
> >     >>     >     > Hello,
> >     >>     >     >
> >     >>     >     > I can see that the Zephyr RTOS has been mentioned in
> >     the FAQ as
> >     >>     >     > one of the ported OS for non-root cells.
> >     >>     >     >
> >     >>     >     > Is there any reference code I can look into?
> >     >>     >
> >     >>     >     There is x86 support for Zephyr as Jailhouse "inmate".
> >     Check out
> >     >>     >     zephyr/boards/x86/x86_jailhouse/doc/board.rst. If you
> >     run into
> >     >>     trouble,
> >     >>     >     report to the communities.
> >     >>     >
> >     >>     >
> >     >>     > Ah, just noticed that it got removed some time ago:
> >     >>     >
> >     >>
> >
> https://github.com/zephyrproject-rtos/zephyr/commit/f3611fdd0c8ca54a9f19bc56a14b4a2fdadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07
> >     >>     >
> >     >>
> >     >>     Too bad they didn't reach out...
> >     >>
> >     >>     > But this could be helpful!
> >     >>     >
> >     >>
> >     >>     Partly. For ARM, you likely don't need so may changes, see
> below.
> >     >>
> >     >>     >
> >     >>     >
> >     >>     >     We could probably also easily support ARM, but the last
> >     time this
> >     >>     >     question came up, there was still not A-core support in
> >     Zephyr
> >     >>     which is
> >     >>     >     a precondition.
> >     >>     >
> >     >>     >
> >     >>     > That's what I'm trying to do on IMX8M EVK in spare time.
> >     There is
> >     >>     an ongoing
> >     >>     > PR for adding Cortex-A support in Zephyr, so I'm planning to
> >     >>     utilize that.
> >     >>
> >     >>     That is good news. If you combine that with the device tree
> >     description
> >     >>     for inmates, actually those for the Linux cells, you should
> >     be able to
> >     >>     boot without code modifications.
> >     >>
> >     >>
> >     >> Don't we need MMU support in inmate? The current ARMv8 PR doesn't
> >     have the
> >     >> MMU support.
> >     >
> >     > Technically, we don't. Earlier versions of our demo inmates were
> >     running
> >     > without MMU as well, but as that implies running without caches as
> >     well,
> >     > we changed that. In any case, the inmate starts in reset state,
> means
> >     > with MMU (and caches) off.
> >     >
> >
> >
> > I got it working partially(not fully though). What would be the Flash and
> > SRAM address would you recommend? The Flash start address should
> > be 0x0 since that's the CPU default start address, how about SRAM?
>
> I didn't play with targets where SRAM was involved so far, but I could
> imagine that it will be easiest to map it at a location where it would
> appear physically in exclusive use as well.
>

I just got it working. FWIW, the wip commits are here:
https://github.com/Mani-Sadhasivam/zephyr/commits/jailhouse

There are couple of caveats though:

1. Zephyr places the vector table at the start/base address and the reset
entry next to it. But jailhouse didn't seem to find the reset entry and it
always tries to start from the base address. Is there any config option
available for fixing this? Since the vector table size is fixed, it should
be relatively simple to make it start from that address I believe.

2. Currently the GICv3 Rdist address is hardcoded for 2nd core but in ideal
case we should find it based on MPIDR value as done in jailhouse inmate
demo. I'm getting faults while trying to read MPIDR_EL1 system register, so
need to debug it.

Thanks,
Mani

>
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CANBTL1XmekrVLi%2BAfTT7oM9tZjNUcOd-7TM8KeeEH6TLSd-b0A%40mail.gmail.com.

--0000000000001b47db0599a6ede7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 6 Dec, 2019, 1:39 PM Jan Kiszka, &lt;<a href=
=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On 05.12.19 20:32, Mani Sadhasivam wr=
ote:<br>
&gt; Hi=C2=A0Jan,<br>
&gt; <br>
&gt; On Thu, Dec 5, 2019 at 1:38 PM Jan Kiszka &lt;<a href=3D"mailto:jan.ki=
szka@siemens.com" target=3D"_blank" rel=3D"noreferrer">jan.kiszka@siemens.c=
om</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank"=
 rel=3D"noreferrer">jan.kiszka@siemens.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[re-adding the mailing list]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 05.12.19 09:07, Jan Kiszka wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On 05.12.19 08:49, Mani Sadhasivam wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; On Thu, Dec 5, 2019 at 1:09 PM Jan Kiszka =
&lt;<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank" rel=3D"nore=
ferrer">jan.kiszka@siemens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank" rel=3D"noreferrer">jan.kiszka@siemens.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@si=
emens.com" target=3D"_blank" rel=3D"noreferrer">jan.kiszka@siemens.com</a> =
&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank" rel=
=3D"noreferrer">jan.kiszka@siemens.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0On 05.12.19 08:14, Mani=
 Sadhasivam wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi Jan,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Dec 5, 201=
9 at 12:36 PM Jan Kiszka<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:jan.kiszka@siemens.com" targe=
t=3D"_blank" rel=3D"noreferrer">jan.kiszka@siemens.com</a> &lt;mailto:<a hr=
ef=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank" rel=3D"noreferrer">j=
an.kiszka@siemens.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"m=
ailto:jan.kiszka@siemens.com" target=3D"_blank" rel=3D"noreferrer">jan.kisz=
ka@siemens.com</a> &lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" tar=
get=3D"_blank" rel=3D"noreferrer">jan.kiszka@siemens.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=
=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank" rel=3D"noreferrer">jan=
.kiszka@siemens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank" rel=3D"noreferrer">jan.kiszka@siemens.com</a>&gt; &lt;m=
ailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank" rel=3D"no=
referrer">jan.kiszka@siemens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank" rel=3D"noreferrer">jan.kiszka@siemens.com</a>&gt;&gt;&g=
t;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0On 02.12.19 19:43, Manivannan Sadhasivam wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; I can see that the Zephyr RTOS has been mentioned in<br>
&gt;=C2=A0 =C2=A0 =C2=A0the FAQ as<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; one of the ported OS for non-root cells.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0&gt; Is there any reference code I can look into?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0There is x86 support for Zephyr as Jailhouse &quot;inmate&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Check out<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0zephyr/boards/x86/x86_jailhouse/doc/board.rst. If you<br>
&gt;=C2=A0 =C2=A0 =C2=A0run into<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0trouble,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0report to the communities.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Ah, just noticed t=
hat it got removed some=C2=A0time ago:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"https://github.com/zephyrproject-r=
tos/zephyr/commit/f3611fdd0c8ca54a9f19bc56a14b4a2fdadaffe3#diff-bb9445fa647=
39ef6a5a6b59d520deb07" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://github.com/zephyrproject-rtos/zephyr/commit/f3611fdd0c8ca54a9f19bc56a14=
b4a2fdadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0Too bad they didn&#39;t=
 reach out...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; But this could be =
helpful!<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0Partly. For ARM, you li=
kely don&#39;t need so may changes, see below.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0We could probably also easily support ARM, but the last<br>
&gt;=C2=A0 =C2=A0 =C2=A0time this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0question came up, there was still not A-core support in<br>
&gt;=C2=A0 =C2=A0 =C2=A0Zephyr<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0which is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=
=A0a precondition.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; That&#39;s what I&=
#39;m trying to do on IMX8M EVK in spare time.<br>
&gt;=C2=A0 =C2=A0 =C2=A0There is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0an ongoing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; PR for adding Cort=
ex-A support in Zephyr, so I&#39;m planning to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0utilize that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0That is good news. If y=
ou combine that with the device tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0description<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0for inmates, actually t=
hose for the Linux cells, you should<br>
&gt;=C2=A0 =C2=A0 =C2=A0be able to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0boot without code modif=
ications.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Don&#39;t we need MMU support in inmate? T=
he current ARMv8 PR doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0have the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; MMU support.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Technically, we don&#39;t. Earlier versions of=
 our demo inmates were<br>
&gt;=C2=A0 =C2=A0 =C2=A0running<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; without MMU as well, but as that implies runni=
ng without caches as<br>
&gt;=C2=A0 =C2=A0 =C2=A0well,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; we changed that. In any case, the inmate start=
s in reset state, means<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; with MMU (and caches) off.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt; <br>
&gt; I got it working partially(not fully though). What would be the Flash =
and<br>
&gt; SRAM address would you recommend? The Flash start address should<br>
&gt; be 0x0 since that&#39;s the CPU default start address, how about SRAM?=
<br>
<br>
I didn&#39;t play with targets where SRAM was involved so far, but I could<=
br>
imagine that it will be easiest to map it at a location where it would<br>
appear physically in exclusive use as well.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I just got it working. FWIW, the=
 wip commits are here:=C2=A0<a href=3D"https://github.com/Mani-Sadhasivam/z=
ephyr/commits/jailhouse">https://github.com/Mani-Sadhasivam/zephyr/commits/=
jailhouse</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">There are =
couple of caveats though:</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">1. Zephyr places the vector table at the start/base address and the reset=
 entry next to it. But jailhouse didn&#39;t seem to find the reset entry an=
d it always tries to start from the base address. Is there any config optio=
n available for fixing this? Since the vector table size is fixed, it shoul=
d be relatively simple to make it start from that address I believe.=C2=A0<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">2. Currently the GICv3 R=
dist address is hardcoded for 2nd core but in ideal case we should find it =
based on MPIDR value as done in jailhouse inmate demo. I&#39;m getting faul=
ts while trying to read MPIDR_EL1 system register, so need to debug it.=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><=
div dir=3D"auto">Mani</div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CANBTL1XmekrVLi%2BAfTT7oM9tZjNUcOd-7TM8KeeEH6TLSd-=
b0A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CANBTL1XmekrVLi%2BAfTT7oM9tZjNUcOd-7TM8Ke=
eEH6TLSd-b0A%40mail.gmail.com</a>.<br />

--0000000000001b47db0599a6ede7--
