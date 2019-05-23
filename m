Return-Path: <jailhouse-dev+bncBCDJXM4674ERBSN3TDTQKGQELBHKTMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id E58FF274F4
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 06:12:58 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id 73sf2322679oty.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 May 2019 21:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PGhQdCByu5KydHFX+rWFN4ZxTWJz+yihU01PftqzuUY=;
        b=Wg+UF8qrl1s6c9EXDm5TePL9Xws1Wg25rDWp/JNMcEYUZU1+aIMvZc7MAS/zolFJu1
         uVHXaeYGADey8Ez3+L84pqDt6gDIVdKA77Hvus6LjN6zcbKoGLDYZDyy+uyqWnkh0aFR
         35lWUh0O8N3k/M7QT3+MdIKwlevtF4lHa/ypi3fIljLUxYS9srqZsUXvP0TQvHVp8g7B
         NVnB2p2FYmXGfkRtf6Q4l1EtDMMXWKnIDADvnUoIvbgsSKey4wPAFWuTexLOhZ++5ATf
         iXwTVHXSGh1k1zCZcwiJQDCgWVk84uBLo4uZEWV0Tb3Qa7EAFPMIHlE8DciB0xS9kp4d
         ja6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PGhQdCByu5KydHFX+rWFN4ZxTWJz+yihU01PftqzuUY=;
        b=I1sX2vQPpLeDgqPcC/8BpVy1eqe96e7mGIAfsPDE1ZiaoXJKrUB+/eeTflyfdACjee
         +09v2l1R85o0LdRLMaZV2OfjPFBWVE2iZ7kk3eR6+Nehp4Wl+8ZTKD20QfMMbYHftXyP
         YXSYaPRLKVbCZUnWBYd+FknRGmn1rQIY8mEzp9VdzI4RM3FAzYKDMssHKfTOlidECnD9
         i+4uZ2rcjMU3Vc6gajKSHE7Ew6bNI0UPJHgq7QTOYhp3BElpcUdc26UoUXZvj1hDqdo9
         tBsF+DezOcJQgC+Y0CdADSESRHrini+BXELKG0snmQ/+tQOCq+i6Lv4ENjawVFZqQrQp
         1rJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PGhQdCByu5KydHFX+rWFN4ZxTWJz+yihU01PftqzuUY=;
        b=qqhdglSnlYmMUtLuvX7jCdRhxlvHXUPunxw60kOpUt7dewW0l6dfrne87CfG1nzVhz
         SpUyYSEDdclWGEVLvS/okLF4q/+2hWvv2619dPJmjIMwZt2bRSw3303RhAUHvUcBpNWp
         MJKKUQ0cOUnKKvm050yLM9j8RE2O0B48HujXsNcRT+KCphHwWvzmK3ZBSExfGhptEQkB
         6YOYvsOyVEq9eoMrIzEwQhLDVcb5wqxWzpzDj1VES/BymEH6o+IA5QprjLGpi+ISBCIk
         HJN7rr53tYHwiDTDlG+DSzy9lMDnmds/HhIZr5uCUhjA+H5wxR5Z7QjZx9CwBkO/kdZg
         AClg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX1xaNm6StQ6S+DlWmOHkk+nxS4rRx0WX8mwIv1nB9put9PiFXr
	iWgtN8nQlCs5wIAw4iMYtTI=
X-Google-Smtp-Source: APXvYqwAeWN2ydLrES2G68L6Uk+AaWaU64fg+aZhHxlQhYkQwmUvTYlBL2w8uCQF1/IxYw7UZ7VLvw==
X-Received: by 2002:a9d:6954:: with SMTP id p20mr11123195oto.337.1558584777559;
        Wed, 22 May 2019 21:12:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:4cd1:: with SMTP id z200ls739409oia.16.gmail; Wed, 22
 May 2019 21:12:57 -0700 (PDT)
X-Received: by 2002:aca:80e:: with SMTP id 14mr1558274oii.2.1558584776800;
        Wed, 22 May 2019 21:12:56 -0700 (PDT)
Date: Wed, 22 May 2019 21:12:56 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <237ede06-527a-41c9-80c0-52fef792a64d@googlegroups.com>
In-Reply-To: <b055f893-dfa4-d0ca-5399-32b1e413229a@web.de>
References: <87722b75-7f3a-4aab-8b7d-421fdcb11620@googlegroups.com>
 <b055f893-dfa4-d0ca-5399-32b1e413229a@web.de>
Subject: Re: Understanding NMIs and Intel x86-64 VMX Preemption Timer
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_213_2055154520.1558584776229"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_213_2055154520.1558584776229
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

Thank you for your detailed response! That was a great explanation. After d=
igesting that, things make a lot more sense. I=E2=80=99ll also try to imple=
ment your suggestions regarding the preemption timer.

I do have a follow-up question:

I understand now that the preemption timer is only needed if the NMI arrive=
s while in host mode, not guest mode. So in guest mode, after an NMI causes=
 a VM exit, why is the NMI interrupt vector called via the INT instruction =
if all it does is enable the preemption timer? This seems redundant, since =
the preemption timer gets disabled almost immediately after being enabled. =
However, I can see that it might provide architectural flexibility if the N=
MI host and NMI guest code paths are somewhat symmetric and both call the N=
MI interrupt vector.

Part of the reason I ask is because the 2014 LWN article seems to be mislea=
ding/out of date regarding this (and may have contributed to some of my ini=
tial confusion):

=E2=80=9CWhen NMI occurs in VM, it exits and Jailhouse re-throws NMI in hos=
t mode. The CPU dispatches it through the host IDT and jumps to apic_nmi_ha=
ndler(). It schedules another VM exit using VMX feature known as preemption=
 timer. vmcs_setup() sets this timer to zero, so if it is enabled, VM exit =
occurs immediately after VM entry. The reason behind this indirection is se=
rialization: this way, NMIs (which are asynchronous by nature) are always d=
elivered after guest entries.=E2=80=9D

If an NMI occurs in the VM, after a VM exit Jailhouse does re-throw the NMI=
 in host mode (INT ... NMI_VECTOR). But it *doesn=E2=80=99t* end up schedul=
ing another VM exit with the preemption timer, unlike the article says, bec=
ause it doesn=E2=80=99t need to.

Also, the article seems to imply that NMI serialization is a goal on its ow=
n, rather than simply a side effect of making the architectural state simpl=
er when the NMI hits the host. Is it?

Thanks for the clarification,

Michael

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/237ede06-527a-41c9-80c0-52fef792a64d%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_213_2055154520.1558584776229--
