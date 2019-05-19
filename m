Return-Path: <jailhouse-dev+bncBCDJXM4674ERB46LQLTQKGQETOC7TWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id B37F222599
	for <lists+jailhouse-dev@lfdr.de>; Sun, 19 May 2019 02:40:21 +0200 (CEST)
Received: by mail-ot1-x33a.google.com with SMTP id e88sf5644730ote.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 18 May 2019 17:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=agdZee3fKuAtrnxeIq/CUC4yQyBGQ92VF8WbbcXoGmQ=;
        b=E5L+1n6uHXCPA43jNE1NljJ1/S4uakIyRS5DnCcnQpc5QkU8AUbg5krT24O0FgbrtG
         R/ogtLw5o9UQ1yrY7GoRuLMIBKA86KTjuO0DdMv7esz6QNHKXuGcPvaF1HjpR3CerDEV
         1Dxb+g3jAajcVpBt1xphEScRxIVRc9iuTZ8J5nu9oU0dewaUIU0NNBA9/PREcnJKgDBB
         CubD6mE0XYhPcULFWaHwt9ktmsOhwkpFqOfM7rH7XwrjUKsuCC+sQZqbX+Yz+Cf3WkKg
         E0xISgRvZiq+uqfithzZkZDLLvsH/ik/yD5YSypg2FViN9NNZeyjxhKxpuhTudHBNCy6
         VZ+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=agdZee3fKuAtrnxeIq/CUC4yQyBGQ92VF8WbbcXoGmQ=;
        b=SSwJivU9N5boaFyrGqrseguqIvn94RVSh3FuKWpSIOuANNHp8riyYc1/UvMDCOQRP+
         Pyr6jWxFzqfXtIV7dQ51BG1vQBf3ZcJVH7/n9VcpVITEJypx/Br74GvzYG/VRFFrC304
         4HJgld/F1iP1+HzlXYngWU7OIvNXynpTP9tJQAAgZPFEQcac/CoqpXIRn5XmT0JXNohd
         +DgW3hwZUuXXLXGYWVqGvKEEJrV1aSpaqLVH9jlcQtaO/FHBPFicoE7Fm3vIsmYlUbqu
         lbor5E26+lkT+vpKHltHh6CqgNRvGEjBuoGDyCii0p9pqKdQtPJcTZ8mA6QqS3aycaPJ
         XMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=agdZee3fKuAtrnxeIq/CUC4yQyBGQ92VF8WbbcXoGmQ=;
        b=AgSKFKaR8MmcbLxaLgKumjw8qQ2i5LguXELCh4OFgyJU+QryEUZAFZEj+7jayGxtv8
         ApfVo8Y2KIB7V8RYJWXq8dSQntaec8AsBxudZzcs8w1/bGJbuaEIwS/U/Zcs9LITXulv
         hWxfWtkFz8Xeb3qkKAr2ODdTuCSb2qMnAGcp8hS+azmVT04LeWMfEVdeIqX0MRRIm6Zp
         bPyhaEDWXGihasNLpi9vXkugbOYb9G2CqzwoE7rLGG2AfclyZhdUeL+AJBB32V4vsJf4
         NdvseIo1WiD7h+kE5DRFnmRCwp48jMWbr4nebVP+gLmNH3dOALbsfzsTi3G3M4LuYlQX
         lYKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU2a3E361yPYRuB/GQMepxFJljIieaEccw1TzLNwqZ8HJ1P4Hub
	G3bDlWmX5RxwEUN2wHexihY=
X-Google-Smtp-Source: APXvYqzVigb/h02Vuj9QS7ohhilZsCceD2K+26Sg9i+glkB8G1pbJyDiuIuP2a1vIhrpBv7kpjV+rQ==
X-Received: by 2002:aca:5b06:: with SMTP id p6mr904287oib.129.1558226420266;
        Sat, 18 May 2019 17:40:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:ec8:: with SMTP id 66ls2393815otj.16.gmail; Sat, 18 May
 2019 17:40:19 -0700 (PDT)
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr26904475otb.81.1558226419306;
        Sat, 18 May 2019 17:40:19 -0700 (PDT)
Date: Sat, 18 May 2019 17:40:18 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <87722b75-7f3a-4aab-8b7d-421fdcb11620@googlegroups.com>
Subject: Understanding NMIs and Intel x86-64 VMX Preemption Timer
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1228_1376242061.1558226418585"
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

------=_Part_1228_1376242061.1558226418585
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

As part of my research, I=E2=80=99ve been looking to modify Jailhouse sligh=
tly to take advantage of the preemption timer provided by VMX for Intel x86=
-64. I know Jailhouse already uses it, but I was hoping to also use it to h=
ave the root cell periodically =E2=80=9Ccheck up=E2=80=9D on the inmate (th=
e intended use case of the preemption timer). I guess it=E2=80=99s similar =
to this topic, but for x86, not arm: https://groups.google.com/d/topic/jail=
house-dev/F074sQtFvao/discussion

Reading the 2014 LWN Jailhouse article, I found this paragraph:

=E2=80=9CCurrently, NMIs can only come from the hypervisor itself which use=
s them to control CPUs... When NMI occurs in VM, it exits and Jailhouse re-=
throws NMI in host mode. The CPU dispatches it through the host IDT... It s=
chedules another VM exit using VMX feature known as preemption timer. vmcs_=
setup() sets this timer to zero, so if it is enabled, VM exit occurs immedi=
ately after VM entry. The reason behind this indirection is serialization: =
this way, NMIs (which are asynchronous by nature) are always delivered afte=
r guest entries (VM entry).=E2=80=9D

So I have a few questions about this:

* What does =E2=80=98serializing NMIs=E2=80=99 mean?=20
* Why is that important?
* How does Jailhouse reinject/deliver the NMI to the guest?

This is my current understanding of the code:

1) NMI occurs in guest, causing a VM exit.
2) vm_exit --> vcpu_handle_exit() --> vmx_handle_exception_nmi()
3) asm volatile("int %0" : : "i" (NMI_VECTOR));
4) nmi_entry --> vcpu_nmi_handler() --> enable preemption timer
5) vcpu_nmi_handler() returns
6) nmi_entry returns
7) vmx_check_events() --> disable preemption timer, x86_check_events()
8) vmx_check_events() returns
9) vmx_handle_exception_nmi() returns
10) vcpu_handle_exit() returns, (triggering a VM entry?)

There must be a VM entry somehow between steps 4 and 7, or else the preempt=
ion timer would continue to be disabled after step 10 and would never trigg=
er (but it does). So where is the VM entry?

Also, I don=E2=80=99t understand how this serializes the NMI, because I don=
=E2=80=99t see how the host delivers the NMI interrupt to the guest. Steps =
2-10 are all on the host, correct?

Thanks for the help,
-Michael

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/87722b75-7f3a-4aab-8b7d-421fdcb11620%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1228_1376242061.1558226418585--
