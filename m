Return-Path: <jailhouse-dev+bncBCFLNWPPWELBBROLRX2AKGQERMIQX3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 62822199A1A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Mar 2020 17:46:14 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id q22sf8983755lfj.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Mar 2020 08:46:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585669574; cv=pass;
        d=google.com; s=arc-20160816;
        b=KkIIY9CFhQXAdAsYWDX1tk54DZhK/uy0zdP+68oPHRz3lKo2y1QhkSiVQEYVQ2B61j
         SUeT/rncw6B/CHHm8mlk5/32TY8KLNl1c9R8YRkvpww3ieSAEkBCb4fJiyreyMRHnIR8
         tPA4j8YpHIQpz+1Ut7dsYyZ/aB2eR2ODgUsaBhdCDBdT5Dg/ZuyMW2nHHIvynXWXfnU2
         QSyDOYssryFjYZb92jmLG9al+i6jRgwnDFecBn2GxVgk/c0kG6mD09zPbGeSu2DsHmgX
         afKZwlp6MC5sGDW14isFg4zE7l4j3NXselYNvZ+ngtHtls+tQXxlmscK76ESHKqRpSre
         Jpvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=0FTC+K+JRAl4DINnNXth51drxriFX5U93EB95TibqzM=;
        b=zU5UkQXcQCD8mRgB5WWYUQi4NlUO2yIEUUDt9x+DeyOqgBL2pRxaOp0E7a/gggLqLB
         GJ/ATjhArFIQN5JH48CvOh/QxUoGuZzkae/Q67PAfE4KN0BY7lB15aXLl46qeKyGED5L
         i1z58ZO+34Nff0mtqswIq3N1FyH06y2xxlpvWg96uBDhaqN76PowIVYpzDQJI96ioMl2
         InQK9zmm62KCSbtYf5lxKXL+ljZwVR0YnDVZAYcA9UStwm6au7FJq3Gay/JfmedxQHzK
         OKnuBOwZBn1vy4iwAAmuTs9mOfnZNIOq/bioVrjEJ8lB09E0Vae7JMY6ezcgupTFBLmd
         708Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=E3YBf8zt;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::529 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0FTC+K+JRAl4DINnNXth51drxriFX5U93EB95TibqzM=;
        b=Mf7vJNISsX0ciE0gj/JVAwyO8G8FmoMCoZLx71GNz/4rLDEQJAqAgS9EzjkA7+i302
         Jc154q1K8cK6xJ0xlZjl2N8gMjIomQxm4EFo9sTf0PnLWJpqt52r6JBY74Xpr9gpvGYl
         OIcutD8oJj/gilfItrybbdxmYgqxfvsi+BFyvncQ6Tnji6WVItLr6ARJmu21Y/+7sRHx
         q09jU1lg2hZTN0DgltSgOOaNalmvlvfUikbgUffTmRFNt7LOe583QEAhYCRWB8cLcIHP
         /LvssDIXHKhQhidOePy40rY1IM+w5FucAjQR7diEWTK9KDWkbhwz7hJewc3RwxCody22
         Oa3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0FTC+K+JRAl4DINnNXth51drxriFX5U93EB95TibqzM=;
        b=hb4uoONSn61iroh1fagg7F9/MT10nPmVbcfDR/yoWNTB3rXMfrZKwO7wCJyzQDrum/
         5ePssGdl40G54EoEDaG6bI0QE9avHrTofn0AplHEye2tLp7oPl5qikbnwFgQElY4pZZ6
         GQTuoJxVlYHgMZuAKh2aCoaCLjyYOZkcRiEUuKnGjRgK/zN4AQbG273YugYd0sVK2vMe
         TUmiZg1V5ThkstXZCVo5+OJrtTIWbsIRV9v30LD17IGAbri1wH1OkHBTCkWq8efkUPwS
         OTxMu6rArBQPDqHJG8uLCWI/JikdTG8Iz7U4I/tyysTlS2nAvwNnKG44oc77hnYTzTq9
         deKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0FTC+K+JRAl4DINnNXth51drxriFX5U93EB95TibqzM=;
        b=qMqn4GwmRmW2LG1BCW17E52o/BNfSJ/j2WRsMxA3QEj/0sjnXU+SfifzAOGlNq3dWO
         LQyLjlVlCwpprrsY+Nw/lyxMNydWsit7x727eBU9546I5Hlj1hrHiWeMj5+BdCeFDk+C
         eYcZuf08rtvrI6HrOtKDI+Cv20KhJNXMXANjvUvcUQbw2a/coxCGzHwGLBp8mkmZbUtt
         dWEPwvaUgSk+aQitTmXal5O70a7b1t4uTutU+uJ1azRmlU7WdXExqeEJpwFxHF06EK0s
         lBs6AyoAsshj1y3UN94KT0ihU8Js1A7fYv6BhbcmYchaxRiJ3nYwhqjWvWMdgPhW4QUl
         bpDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubXdX2GXjLHpML9KpJh1iPHezPqQM81QXeXOQS6rYw7ISGWsTjy
	du1XuPHO+gJHDtNEHmzcmso=
X-Google-Smtp-Source: APiQypLxqtGiZSDzC4RKxZxS6r8IHQzWh30bXJP6fcNAbSxN5eZB6b6JA/Lbno80IYRXg/IKOK5edw==
X-Received: by 2002:ac2:5edc:: with SMTP id d28mr11797788lfq.59.1585669573804;
        Tue, 31 Mar 2020 08:46:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:89c8:: with SMTP id c8ls3431093ljk.7.gmail; Tue, 31 Mar
 2020 08:46:13 -0700 (PDT)
X-Received: by 2002:a2e:a173:: with SMTP id u19mr10836371ljl.67.1585669572926;
        Tue, 31 Mar 2020 08:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585669572; cv=none;
        d=google.com; s=arc-20160816;
        b=b6lqa3p6kD0TxAbZY/bud/gUTVrB1JJo5Rbcj4wN6FFkcywvcuTNFk+h+dkoXo0bRy
         gCiOAKC04nY6fR2oj7ptXNOO99Gdb+Gzx/TY01528mTt0yr70z1CszVBUFbPWWGE7pM2
         RcUz3yIL1HAH3FcXXciNxYEsTO10N8FUa+aKlE4htExbLMmq2JdbqvRMo1uZsaJJpHtO
         WYHsIwkTiDx6IBPvmca6O652gJluS6QPkt62x82Fk3ddV7aF7zfzHYC0x6zttR7IIpJw
         okBFMPpW8BHUEgRnzQJuqmM1yjWFExEUGewtQFF6STlCTP1rzZ79pSGCYoN0OMmv8W2K
         1jpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CAGrpSb1OMAw2UHuD5uwakM8WayN6VLRPbgnseYNKtY=;
        b=nS8FIqhzSpau1qe7ZhBWB1Zx9c4NIq51fn67GoE8J63yoOGfiueA8Nj1TEInfn4iDs
         1ZN3G50aRxm6Y1+266mhyq+SJaOgDYBr2lX7QJ56xfjsZyJtZ92mzb/HlZJQg/X5LCH3
         g0RdnJbWLzN/O2MGaGJyTnY7m71BnCthLrdZ9ie6uhjc6JttesaKV0uVgGFbaM81crkm
         OLgpGWn7+NU2mFx8z2nO5hVDWNrkohuwuUhr1gZaEBjoNt52wPhc2PMbYNXpQ6cV+ETM
         Mxk/xeyt60b+vUtJrTcsR5BjN/+JDBkQGOHf57zeXFa4xwGXUhWT3mSKJnSkbB3gg3AE
         iezQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=E3YBf8zt;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::529 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com. [2a00:1450:4864:20::529])
        by gmr-mx.google.com with ESMTPS id q13si1217690lfo.3.2020.03.31.08.46.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 08:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::529 as permitted sender) client-ip=2a00:1450:4864:20::529;
Received: by mail-ed1-x529.google.com with SMTP id o1so7457740edv.1
        for <jailhouse-dev@googlegroups.com>; Tue, 31 Mar 2020 08:46:12 -0700 (PDT)
X-Received: by 2002:a17:906:ecee:: with SMTP id qt14mr16180865ejb.180.1585669572581;
 Tue, 31 Mar 2020 08:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
 <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com> <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
 <a0c156aa-f87d-e5ea-d3c3-7b7929c503c4@web.de> <CAD6ScS9oSd9=emq3ywSTEng2EwWj1AoBsYQhizEuSP8osMM7sQ@mail.gmail.com>
 <8c54c380-92e7-046c-33e1-4c88a3446bfb@web.de> <CAD6ScS-ZpOunQC0EhfDTQaPX_ua=dcCccF+UwMoLo=o+ROE42A@mail.gmail.com>
 <990fc418-0b4e-b2b2-8963-af350a8c516c@web.de> <CAD6ScS9MgX8LQ0GTLhDzyNv13xa3=z7DgfzCX3c9nEqKz4e0Wg@mail.gmail.com>
 <2955ec65-f973-694a-a5fa-5f3a08243e2c@web.de>
In-Reply-To: <2955ec65-f973-694a-a5fa-5f3a08243e2c@web.de>
From: PRAKHAR BANSAL <prakharbansal0910@gmail.com>
Date: Tue, 31 Mar 2020 10:45:36 -0500
Message-ID: <CAD6ScS_a+MHgmo9n=P07uVSFeUeU33qNUQ9qykxAtR8jE0f3HA@mail.gmail.com>
Subject: Re: GSoC'20 Interested Student: Adding support to Jailhouse Hypervisor
To: Jan Kiszka <jan.kiszka@web.de>
Cc: jailhouse-dev@googlegroups.com, 
	"libvir-list@redhat.com" <libvir-list@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009ade8105a2287723"
X-Original-Sender: prakharbansal0910@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=E3YBf8zt;       spf=pass
 (google.com: domain of prakharbansal0910@gmail.com designates
 2a00:1450:4864:20::529 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
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

--0000000000009ade8105a2287723
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

I have shared the draft proposal link with libvirt on GSoC's system.
Could you please check and provide your feedback, if possible.

Thanks,
Prakhar

On Tue, Mar 31, 2020 at 1:47 AM Jan Kiszka <jan.kiszka@web.de> wrote:

> On 31.03.20 04:43, PRAKHAR BANSAL wrote:
> > Hi Jan,
> >
> > Thanks for the confirmation to proceed on project proposal.
> >
> > Also, I tried installing Jailhouse on my VM after enabling VT-x/EPT and
> > IOMMU for my VM(Guest OS- Ubuntu 18.04) on VMware fusion hypervisor with
> > MacOS on the host side.
> > However,  Jailhouse hardware check was failed because of missing
> > *Preemption timer and Virtualize APIC access*, could you please suggest,
> > if this is hardware limitation?  Is there any workaround here?
>
> You will need a hypervisor that supports both when nesting, but I have
> no idea if there is one for the Mac. What is known to work is KVM on
> Linux hosts.
>
> > My laptop's processor is Intel quad-core i7.
> >
> > image.png
> >
> > Also, could you please suggest, if I can talk to you through an IRC or
> > slack channel since it is a bit hard to communicate over email every
> time.
>
> I'll be listening on #jailhouse, irc.freenode.net.
>
> Jan
>
> >
> > Thanks,
> > Prakhar
> >
> >
> > On Mon, Mar 30, 2020 at 6:15 AM Jan Kiszka <jan.kiszka@web.de
> > <mailto:jan.kiszka@web.de>> wrote:
> >
> >     On 30.03.20 10:02, PRAKHAR BANSAL wrote:
> >      > Hi Jan,
> >      >
> >      > On Sat, Mar 28, 2020 at 4:12 AM Jan Kiszka <jan.kiszka@web.de
> >     <mailto:jan.kiszka@web.de>
> >      > <mailto:jan.kiszka@web.de <mailto:jan.kiszka@web.de>>> wrote:
> >      >
> >      >     On 28.03.20 08:47, PRAKHAR BANSAL wrote:
> >      >      > Hi Jan,
> >      >      >
> >      >      > Thanks for the reply!
> >      >      >
> >      >      > I was only considering the command-line tool "code" for
> >     reference
> >      >     to the
> >      >      > Jailhouse kernel API(ioctl calls) because I didn't find a
> >      >     documentation
> >      >      > of the Jailhouse kernel APIs.
> >      >
> >      >     Right, the IOCTL API is not documented so far. It is
> >     currently only used
> >      >     inside the Jailhouse project. This needs to be formalized
> >     when there
> >      >     shall be external users like a libvirt driver.
> >      >
> >      >     That might be a nice small contribution task: Create some
> >      >     Documentation/driver-interfaces.md that describes the IOCTLs
> >     along with
> >      >     their parameter structures and that also includes the current
> >      >     sysfs-entries.txt as a section. Then send this as patch here.
> >     I'll help
> >      >     out when details are not clear from reading the code.
> >      >
> >      > Sure. I will do that.
> >      >
> >      >      >
> >      >      > For the second part as you mentioned that Jailhouse can
> >     only create
> >      >      > cells with the constraints defined in the root cell
> >     configuration. I
> >      >      > have a few questions regarding that.
> >      >      >
> >      >      > 1. Is there a way to know if Jailhouse is enabled on the
> >     host and get
> >      >      > the root cell configuration(s) from Jailhouse through an
> API?
> >      >     This can
> >      >      > be used while binding the libvirt to the Jailhouse
> hypervisor.
> >      >
> >      >     Look at
> >      >
> >
> https://github.com/siemens/jailhouse/blob/master/Documentation/sysfs-entries.txt
> >      >     for what is reported as runtime information. Full
> >     configurations can't
> >      >     be read back at this point. This might be reconsidered in the
> >     light of
> >      >     [1], but I wouldn't plat for that yet.
> >      >
> >      >
> >      > Ok, sure. I am looking into it.
> >      >
> >      >
> >      >      >
> >      >      > 2. If Jailhouse is not enabled(again can we know this
> >     using some API)
> >      >      > then, can libvirt enable/disable Jailhouse during the
> libvirt
> >      >     binding of
> >      >      > the Jailhouse driver with a given set of Jailhouse cell
> >      >     configurations
> >      >      > describing a complete partitioned system?
> >      >
> >      >     With the API above and a given configuration set, yes. The
> >     config set
> >      >     would have to be provided to the libvirt driver in some
> >     to-be-defined
> >      >     way (e.g. /etc/libvirt/jailhouse.conf ->
> >     /etc/libvirt/jailhouse/*.cell).
> >      >
> >      > Cool, got it. Thanks!
> >      >
> >      >      >
> >      >      > 3. I was wondering, as you mentioned that libvirt driver
> >     should check
> >      >      > for mismatch of the cell configuration with the root cell
> >      >     configuration,
> >      >      > the question is, isn't that done by Jailhouse itself? If
> >     yes, then
> >      >      > libvirt can just pass on the cell creation requests to
> >     Jailhouse and
> >      >      > return the response to the user as it is, rather than
> driver
> >      >     doing any
> >      >      > such mismatch check.
> >      >
> >      >     With matching I'm referring to a libvirt user request like
> >     "create a
> >      >     domain with 2 CPUs", while there are no cells left that have
> >     more than
> >      >     one CPU. Or "give the domain 1G RAM", and you need to find an
> >     available
> >      >     cell with that much memory. Those are simple examples. A
> >     request that
> >      >     states "connect the domain to the host network A" implies
> >     that a cell
> >      >     has a shared-memory link to, say, the root cell that can be
> >     configured
> >      >     to bridge this. But let's keep that for later and start as
> >     simple as
> >      >     possible.
> >      >
> >      >
> >      > Do I need to match the libvirt user-requested cell config with
> >     only root
> >      > cells or with all cells present at that time?
> >
> >     With all non-root cells - the root cell will be occupied already (it
> >     runs libvirt e.g.).
> >
> >      >
> >      > I wanted to request you for a favor for the proposal as the
> >     deadline is
> >      > approaching. Could I prepare a proposal for this project based on
> our
> >      > discussion here and improve it later based on feedback comments
> after
> >      > the deadline? I understand that I got late in starting on the
> project
> >      > search and selection.
> >
> >     Sure, please go ahead.
> >
> >     Jan
> >
> >      >
> >      > Thanks,
> >      > Prakhar
> >      >
> >      >
> >      >     Jan
> >      >
> >      >     [1]
> >      >
> >
> https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1QiRhSWZnw%2BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail.gmail.com
> >      >
> >      >      >
> >      >      > -Prakhar
> >      >      >
> >      >      > On Thu, Mar 26, 2020 at 1:49 AM Jan Kiszka
> >     <jan.kiszka@web.de <mailto:jan.kiszka@web.de>
> >      >     <mailto:jan.kiszka@web.de <mailto:jan.kiszka@web.de>>
> >      >      > <mailto:jan.kiszka@web.de <mailto:jan.kiszka@web.de>
> >     <mailto:jan.kiszka@web.de <mailto:jan.kiszka@web.de>>>> wrote:
> >      >      >
> >      >      >     Hi Prakhar,
> >      >      >
> >      >      >     On 25.03.20 05:36, PRAKHAR BANSAL wrote:
> >      >      >      > Hi Jan,
> >      >      >      >
> >      >      >      > Thanks for the reply. I looked deeper into the
> >     libvirt and
> >      >     Jailhouse
> >      >      >      > source code and found following two things that seem
> >      >     relevant to the
> >      >      >      > project I am interested in.
> >      >      >      >
> >      >      >      > - Libvirt driver interface at [libvirt.git]
> >      >      >      >
> >     <https://libvirt.org/git/?p=libvirt.git;a=tree;hb=HEAD> / src
> >      >      >      >
> >      >     <https://libvirt.org/git/?p=libvirt.git;a=tree;f=src;hb=HEAD
> > /
> >      >      >     driver.h
> >      >      >      >
> >      >      >
> >      >
> >       <
> https://libvirt.org/git/?p=libvirt.git;a=blob_plain;f=src/driver.h;hb=HEAD
> >
> >      >      >      > - Jailhouse tool, which is using the ioctl API of
> the
> >      >     Jailhouse,
> >      >      >      > available at
> >      >      >      >
> >      >
> https://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c.
> >      >      >      >
> >      >      >      > With the help of the above two, it looks like, a
> >     libvirt
> >      >     driver
> >      >      >     for the
> >      >      >      > Jailhouse can be implemented. Let me know if I am
> >     moving
> >      >     in the right
> >      >      >      > direction so far.
> >      >      >
> >      >      >       From the Jailhouse perspective, it is important to
> not
> >      >     consider the
> >      >      >     command line tool an interface anymore (like in the
> first
> >      >     prototype) but
> >      >      >     build on top of the Linux driver API (ioctls, sysfs).
> >     There
> >      >     is already a
> >      >      >     Python library which started to abstract this
> >     interface for
> >      >      >     Jailhouse-internal use cases. However, I strongly
> suspect
> >      >     libvirt will
> >      >      >     rather want a native binding.
> >      >      >
> >      >      >      >
> >      >      >      > I have been looking at the other libvirt driver
> >      >     implementations for
> >      >      >      > hypervisors like HyperV and VMware to understand
> their
> >      >     implementation
> >      >      >      > and learn from there.
> >      >      >
> >      >      >     As Jailhouse is a static partitioning hypervisor
> without
> >      >     abstraction of
> >      >      >     the underlying hardware, your starting point for the
> >     libvirt
> >      >     binding
> >      >      >     should be a given set of Jailhouse cell configurations
> >      >     describing a
> >      >      >     complete partitioned system. So rather than
> >     instantiating on
> >      >     demand a
> >      >      >     domain (Jailhouse cell) with, say, a network adapter,
> the
> >      >     driver should
> >      >      >     match a user request for a domain against the
> >     configuration
> >      >     set and use
> >      >      >     what is there - or report the mismatch. What it could
> >      >     organize, though,
> >      >      >     is interconnecting cells that have a (preconfigured)
> >     virtual
> >      >     network
> >      >      >     link to the root cell.
> >      >      >
> >      >      >     Due to this different concept, there will be no 1:1
> >     mapping for
> >      >      >     commodity hypervisor drivers to the Jailhouse scenario.
> >      >     Still, studying
> >      >      >     what they do is useful and needed in order to
> >     understand what
> >      >     "normally"
> >      >      >     happens and find a reasonable translation. This is
> >     probably
> >      >     the most
> >      >      >     challenging part of the project.
> >      >      >
> >      >      >     Jan
> >      >      >
> >      >
> >
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD6ScS_a%2BMHgmo9n%3DP07uVSFeUeU33qNUQ9qykxAtR8jE0f3HA%40mail.gmail.com.

--0000000000009ade8105a2287723
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Jan,<div><br></div><div>I have shared the draft pr=
oposal link with libvirt on GSoC&#39;s system.</div><div>Could you please c=
heck and provide your feedback, if possible.</div><div><br></div><div>Thank=
s,</div><div>Prakhar</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Mar 31, 2020 at 1:47 AM Jan Kiszka &lt;<a=
 href=3D"mailto:jan.kiszka@web.de">jan.kiszka@web.de</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204)=
;padding-left:1ex">On 31.03.20 04:43, PRAKHAR BANSAL wrote:<br>
&gt; Hi=C2=A0Jan,<br>
&gt;<br>
&gt; Thanks for the confirmation to proceed on project proposal.<br>
&gt;<br>
&gt; Also, I tried installing Jailhouse on my VM after enabling VT-x/EPT an=
d<br>
&gt; IOMMU for my VM(Guest OS- Ubuntu 18.04) on VMware fusion hypervisor wi=
th<br>
&gt; MacOS on the host side.<br>
&gt; However, =C2=A0Jailhouse hardware check was failed because of missing<=
br>
&gt; *Preemption=C2=A0timer and Virtualize APIC access*, could you please s=
uggest,<br>
&gt; if this is hardware limitation?=C2=A0 Is there any workaround=C2=A0her=
e?<br>
<br>
You will need a hypervisor that supports both when nesting, but I have<br>
no idea if there is one for the Mac. What is known to work is KVM on<br>
Linux hosts.<br>
<br>
&gt; My laptop&#39;s processor is Intel quad-core i7.<br>
&gt;<br>
&gt; image.png<br>
&gt;<br>
&gt; Also, could you please suggest, if I can talk to you through an IRC or=
<br>
&gt; slack channel since it is a bit hard to communicate over email every t=
ime.<br>
<br>
I&#39;ll be listening on #jailhouse, <a href=3D"http://irc.freenode.net" re=
l=3D"noreferrer" target=3D"_blank">irc.freenode.net</a>.<br>
<br>
Jan<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Prakhar<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Mar 30, 2020 at 6:15 AM Jan Kiszka &lt;<a href=3D"mailto:jan.k=
iszka@web.de" target=3D"_blank">jan.kiszka@web.de</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@web.de" target=3D"_blank">jan.=
kiszka@web.de</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 30.03.20 10:02, PRAKHAR BANSAL wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi=C2=A0Jan,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Sat, Mar 28, 2020 at 4:12 AM Jan Kiszka &l=
t;<a href=3D"mailto:jan.kiszka@web.de" target=3D"_blank">jan.kiszka@web.de<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@web.de" tar=
get=3D"_blank">jan.kiszka@web.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@web.d=
e" target=3D"_blank">jan.kiszka@web.de</a> &lt;mailto:<a href=3D"mailto:jan=
.kiszka@web.de" target=3D"_blank">jan.kiszka@web.de</a>&gt;&gt;&gt; wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 28.03.20 08:47, PRAKHAR=
 BANSAL wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi=C2=A0Jan,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks for the reply=
!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I was only consideri=
ng=C2=A0the command-line tool &quot;code&quot; for<br>
&gt;=C2=A0 =C2=A0 =C2=A0reference<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Jailhouse kernel API=
(ioctl calls) because I didn&#39;t find a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0documentation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; of the Jailhouse ker=
nel APIs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Right, the IOCTL API is no=
t documented so far. It is<br>
&gt;=C2=A0 =C2=A0 =C2=A0currently only used<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0inside the Jailhouse proje=
ct. This needs to be formalized<br>
&gt;=C2=A0 =C2=A0 =C2=A0when there<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0shall be external users li=
ke a libvirt driver.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0That might be a nice small=
 contribution task: Create some<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Documentation/driver-inter=
faces.md that describes the IOCTLs<br>
&gt;=C2=A0 =C2=A0 =C2=A0along with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0their parameter structures=
 and that also includes the current<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0sysfs-entries.txt as a sec=
tion. Then send this as patch here.<br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;ll help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0out when details are not c=
lear from reading the code.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Sure. I will do that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; For the second part =
as you mentioned that Jailhouse can<br>
&gt;=C2=A0 =C2=A0 =C2=A0only create<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; cells with the const=
raints defined in the root cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0configuration. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; have a few questions=
 regarding that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1. Is there a way to=
 know if Jailhouse is enabled on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0host and get<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; the root cell config=
uration(s) from Jailhouse through an API?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0This can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; be used while bindin=
g the libvirt to the Jailhouse hypervisor.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Look at<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/siemens/jailhouse/blo=
b/master/Documentation/sysfs-entries.txt" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/siemens/jailhouse/blob/master/Documentation/sysfs-en=
tries.txt</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0for what is reported as ru=
ntime information. Full<br>
&gt;=C2=A0 =C2=A0 =C2=A0configurations can&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0be read back at this point=
. This might be reconsidered in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0light of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[1], but I wouldn&#39;t pl=
at for that yet.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Ok, sure. I am looking into it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 2. If Jailhouse is n=
ot enabled(again can we know this<br>
&gt;=C2=A0 =C2=A0 =C2=A0using some API)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; then, can libvirt en=
able/disable Jailhouse during the libvirt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0binding of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; the Jailhouse driver=
 with a given set of Jailhouse cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0configurations<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; describing a complet=
e partitioned system?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0With the API above and a g=
iven configuration set, yes. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0config set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0would have to be provided =
to the libvirt driver in some<br>
&gt;=C2=A0 =C2=A0 =C2=A0to-be-defined<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0way (e.g. /etc/libvirt/jai=
lhouse.conf -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/etc/libvirt/jailhouse/*.cell).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Cool, got it. Thanks!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 3. I was wondering, =
as you mentioned that libvirt driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0should check<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; for mismatch of the =
cell configuration with the root cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0configuration,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; the question is, isn=
&#39;t that done by Jailhouse itself? If<br>
&gt;=C2=A0 =C2=A0 =C2=A0yes, then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; libvirt can just pas=
s on the cell creation requests to<br>
&gt;=C2=A0 =C2=A0 =C2=A0Jailhouse and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; return the response =
to the user as it is, rather than driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0doing any<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; such mismatch check.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0With matching I&#39;m refe=
rring to a libvirt user request like<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;create a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0domain with 2 CPUs&quot;, =
while there are no cells left that have<br>
&gt;=C2=A0 =C2=A0 =C2=A0more than<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0one CPU. Or &quot;give the=
 domain 1G RAM&quot;, and you need to find an<br>
&gt;=C2=A0 =C2=A0 =C2=A0available<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0cell with that much memory=
. Those are simple examples. A<br>
&gt;=C2=A0 =C2=A0 =C2=A0request that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0states &quot;connect the d=
omain to the host network A&quot; implies<br>
&gt;=C2=A0 =C2=A0 =C2=A0that a cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0has a shared-memory link t=
o, say, the root cell that can be<br>
&gt;=C2=A0 =C2=A0 =C2=A0configured<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0to bridge this. But let&#3=
9;s keep that for later and start as<br>
&gt;=C2=A0 =C2=A0 =C2=A0simple as<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0possible.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Do I need to match the libvirt user-requested=
 cell config with<br>
&gt;=C2=A0 =C2=A0 =C2=A0only root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; cells or with all cells present at that time?=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0With all non-root cells - the root cell will be occ=
upied already (it<br>
&gt;=C2=A0 =C2=A0 =C2=A0runs libvirt e.g.).<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I wanted to request you for a favor for the p=
roposal as the<br>
&gt;=C2=A0 =C2=A0 =C2=A0deadline is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; approaching. Could I prepare a proposal for t=
his project based on our<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; discussion here and improve it later based on=
 feedback comments after<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the deadline? I understand that I got late in=
 starting on the project<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; search and selection.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Sure, please go ahead.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Prakhar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0[1]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://groups.google.com/d/msgid/jailho=
use-dev/CADiTV-1QiRhSWZnw%2BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail.gmail.=
com" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgid=
/jailhouse-dev/CADiTV-1QiRhSWZnw%2BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail=
.gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Prakhar<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Thu, Mar 26, 2020=
 at 1:49 AM Jan Kiszka<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:jan.kiszka@web.de" target=3D"=
_blank">jan.kiszka@web.de</a> &lt;mailto:<a href=3D"mailto:jan.kiszka@web.d=
e" target=3D"_blank">jan.kiszka@web.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mail=
to:jan.kiszka@web.de" target=3D"_blank">jan.kiszka@web.de</a> &lt;mailto:<a=
 href=3D"mailto:jan.kiszka@web.de" target=3D"_blank">jan.kiszka@web.de</a>&=
gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=
=3D"mailto:jan.kiszka@web.de" target=3D"_blank">jan.kiszka@web.de</a> &lt;m=
ailto:<a href=3D"mailto:jan.kiszka@web.de" target=3D"_blank">jan.kiszka@web=
.de</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@web.de" tar=
get=3D"_blank">jan.kiszka@web.de</a> &lt;mailto:<a href=3D"mailto:jan.kiszk=
a@web.de" target=3D"_blank">jan.kiszka@web.de</a>&gt;&gt;&gt;&gt; wrote:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0H=
i Prakhar,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0O=
n 25.03.20 05:36, PRAKHAR BANSAL wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; Hi Jan,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; Thanks for the reply. I looked deeper into the<br>
&gt;=C2=A0 =C2=A0 =C2=A0libvirt and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; source code and found following two things that seem<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0relevant to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; project I am interested in.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; - Libvirt driver interface at [libvirt.git]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://libvirt.org/git/?p=3Dlibvirt=
.git;a=3Dtree;hb=3DHEAD" rel=3D"noreferrer" target=3D"_blank">https://libvi=
rt.org/git/?p=3Dlibvirt.git;a=3Dtree;hb=3DHEAD</a>&gt;=C2=A0/ src<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lib=
virt.org/git/?p=3Dlibvirt.git;a=3Dtree;f=3Dsrc;hb=3DHEAD" rel=3D"noreferrer=
" target=3D"_blank">https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;f=3Ds=
rc;hb=3DHEAD</a>&gt;=C2=A0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0d=
river.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://libvirt.org/git/?p=3D=
libvirt.git;a=3Dblob_plain;f=3Dsrc/driver.h;hb=3DHEAD" rel=3D"noreferrer" t=
arget=3D"_blank">https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dblob_plain;f=
=3Dsrc/driver.h;hb=3DHEAD</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; - Jailhouse tool, which is using the ioctl API of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Jailhouse,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; available at<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://github.com/siemens/jailhou=
se/blob/master/tools/jailhouse.c" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c</a>.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; With the help of the above two, it looks like, a<br>
&gt;=C2=A0 =C2=A0 =C2=A0libvirt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0f=
or the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; Jailhouse can be implemented. Let me know if I am<br>
&gt;=C2=A0 =C2=A0 =C2=A0moving<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0in the right<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; direction so far.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0From the Jailhouse perspective, it is important to not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0consider the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0c=
ommand line tool an interface anymore (like in the first<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0prototype) but<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0b=
uild on top of the Linux driver API (ioctls, sysfs).<br>
&gt;=C2=A0 =C2=A0 =C2=A0There<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0is already a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0P=
ython library which started to abstract this<br>
&gt;=C2=A0 =C2=A0 =C2=A0interface for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0J=
ailhouse-internal use cases. However, I strongly suspect<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0libvirt will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0r=
ather want a native binding.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; I have been looking at the other libvirt driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0implementations for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; hypervisors like HyperV and VMware to understand their<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0implementation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =
&gt; and learn from there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0A=
s Jailhouse is a static partitioning hypervisor without<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0abstraction of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0t=
he underlying hardware, your starting point for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0libvirt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0binding<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0s=
hould be a given set of Jailhouse cell configurations<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0describing a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0c=
omplete partitioned system. So rather than<br>
&gt;=C2=A0 =C2=A0 =C2=A0instantiating on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0demand a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0d=
omain (Jailhouse cell) with, say, a network adapter, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0driver should<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0m=
atch a user request for a domain against the<br>
&gt;=C2=A0 =C2=A0 =C2=A0configuration<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0set and use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0w=
hat is there - or report the mismatch. What it could<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0organize, though,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0i=
s interconnecting cells that have a (preconfigured)<br>
&gt;=C2=A0 =C2=A0 =C2=A0virtual<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0network<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0l=
ink to the root cell.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0D=
ue to this different concept, there will be no 1:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0mapping for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0c=
ommodity hypervisor drivers to the Jailhouse scenario.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Still, studying<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0w=
hat they do is useful and needed in order to<br>
&gt;=C2=A0 =C2=A0 =C2=A0understand what<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;normally&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0h=
appens and find a reasonable translation. This is<br>
&gt;=C2=A0 =C2=A0 =C2=A0probably<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0the most<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0c=
hallenging part of the project.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0J=
an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;<br>
<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD6ScS_a%2BMHgmo9n%3DP07uVSFeUeU33qNUQ9qykxAtR8jE=
0f3HA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAD6ScS_a%2BMHgmo9n%3DP07uVSFeUeU33qNUQ=
9qykxAtR8jE0f3HA%40mail.gmail.com</a>.<br />

--0000000000009ade8105a2287723--
