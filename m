Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBIFTQTTQKGQE57IA2QY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA822654
	for <lists+jailhouse-dev@lfdr.de>; Sun, 19 May 2019 10:53:52 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id w16sf1415569lff.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 19 May 2019 01:53:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558256032; cv=pass;
        d=google.com; s=arc-20160816;
        b=KjGHsYDuv+l7vqBGI6YayAfjZtrceOWG55oebMsVj3tRdFzLLkfru8MoEmMBRCyTQ/
         SN8yLVAEpO8THoOMNJpYo85TIYa6ATvaa1VhDmw1OMK8H+hNSJq1/TWgjpbaY7ZJjFSi
         2kNqWnALrsSCA1Z8itKr5nQdFNA38ZhAFmEqiKu8gd2xyA7LuTPTtQjUtBL61oGrQaUl
         SP9oWUs23IFhlnbySILmFLKz2byvKXt5tEhdg80cHKIg9w6/y+n8jMs49GzcHRwY/jXs
         nQtOXutxWUijuK4NIaPhANSIYRePSfeDWSTDYbI25GdVHN/FYQZYPDvGhTjab4xfIjX+
         v1fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=5CEXoCVKQC1H/zwaeHY/DwviIB86a49u7sBcUFOiaPo=;
        b=aioWePdBRXvrSXcm2eq+4IPe1kQvjAwgwjGzEgNxHhC3gSDYN6ADDfdGATS3SR3/Ww
         vytI5KDsgPlYdTyVrmp2baXgbWjsIKbKoJvBU1d0gspeGhxLXiEGJ9KoigH24BbcvN3h
         mmgBK7/qE4s41jjQV/rqtGiHZStcH480woAUsPUmUKIw2GV8Wdx6oqVyd+dhIKh/qTmD
         KSuH2PO+XQc7NY/qMyWUFqjf52A53e9PQRoLv/nBPCtjtjnZeHYfEwOxEkQCoC2NFQup
         byzriOhJLwEpLQjoqo46HR14jpJ9ZLvjpkyJdTowIfnbh/naGP0fmRKN122fQivwwUge
         m+KA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QAgOWnDm;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5CEXoCVKQC1H/zwaeHY/DwviIB86a49u7sBcUFOiaPo=;
        b=rFEBmPy+7hKRSbmxjNheJdwbBKjDc7qAKN2garWXouzx5OxvK9ACz5HKmTnMi5wxHm
         BjgMIJQGqS3sYYO+F/JPRzQ8nhtaLpXWwKYTfYjRpObzAfXalIsZDLomub+lIGGoM/AL
         KTcwbRytdxvpfVK2CmptN1x+sAvF5I86g2YmDE+hPe1ZWCpD9QHF2hBdLHK9TE7OtWFX
         0TRrwmlHeNzt+p7EV+CMdjbSgrZcEmypVlvHEDm2riPt9UuIvbGYdVlm1467+chuNIAG
         fU+BYdpfuq67KF6upFUS8r4AF5s3hsPO2vJjz8xweG5XwBGXaUkpcWR/Vv/PYNRVXQxS
         wMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5CEXoCVKQC1H/zwaeHY/DwviIB86a49u7sBcUFOiaPo=;
        b=SnjAP7CwFrGTg/jTqoNAruB15nlgVaU2mmp+cc1GrBpykcdeBLMtBtOdBBhpmXSEOW
         4uCuV4bQ87u38KDuR13udkeJTJ9rNQMvz9llkyaPgalb60OpeV8gT5T3SCFjABNop4kr
         iI8OZBihXnAeK6ZNqXuwFeqwKv6xs6Sf+l7jGdX/J7O02gkosL2BkBjIrN85EcAw93f2
         iFWT/oy0E8n1ctivKM0UG1TIkoL0CvRgTtuaw7H92SLKecaZU4fySWWXlMHhLSdAIkVE
         /O/yI7BB7+Q2eWHB6Fv+OoZB1Irx33f9oTcMuqiQV3wIpF6KAjmtOPJUo7vCqUIg4zSl
         TiiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUhTbU/tjfSgkpGtiIdCxzPklMTX6uQPnNjKyH26ldkCSMoFSe3
	8ohC6TzIS8OvfqwnqbgmFOg=
X-Google-Smtp-Source: APXvYqw2VklDPV33aIv2Juhv7Hx2p9lBAVMsPJemFVLiUBCO38IC4FRKf3zDxxoe4kcINiPKcbjZkA==
X-Received: by 2002:a19:4cd5:: with SMTP id z204mr18415002lfa.113.1558256032299;
        Sun, 19 May 2019 01:53:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6356:: with SMTP id x83ls1487230ljb.7.gmail; Sun, 19 May
 2019 01:53:51 -0700 (PDT)
X-Received: by 2002:a2e:80d5:: with SMTP id r21mr22258076ljg.43.1558256031799;
        Sun, 19 May 2019 01:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558256031; cv=none;
        d=google.com; s=arc-20160816;
        b=SMG4/tEc/gvm5AkzCVW/TU2BJyn0+98dYQHQGL/LDLm2KnrYoV+j+4Il9oCfVaUw8K
         RMLqSiW2aOrzbi1YkeI7e6c+/zBTXDAJLnKEASvOmhxtGAInt9UgsZRATFVBMVnC7DgB
         v4o/I0CU8pgX0vi6r58yANwHOqDxDkyfvyHnDTNcE1JNfsu2avCLQ5UaJM+2B4++QfX4
         IhrrhqpItgJoTZ0814zeAIk8C5QV96ipuK+CWr8xuYSzJQInbNImvR1vKXz1mPKld9sH
         Ov/ttSoPX+9E/CVOaIsAyUQWP4EFEpo9XTgwBdqNmTKmtciYnHAJhGlpv8sIF6lG7gLY
         cciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=2DgQdKpGgcdXco4V+0ronoOAttESfNx85Uk3V/CXYyY=;
        b=saV2FFaUvbViMXZnG+fQJy04jz31dUrsE7U3KkGXxl+HkwYhz6ZN42Zg7sjaWoru3M
         0JQfFhb90BiXXxpuRpxz0Apgk9x/1QKvBUdJJ1gWnpdgZlFC87XnG9vcm+5R8Bo1PgCC
         g5fTDIgMsVgBF75HS1BxH7z60L+zrTcFR4TDHXbu1qX6vG1msZ7uwbngKCCtnDyfFJ3n
         Tf09Dar5J0bRzgOia5ljgu6JX5Kb/A7NqokNkSN2ujS57fKEiTLRCJos/s9M26WZTLOx
         7tlXECzdHGxMHwfIhDdwZkBRu9IUJJjWydAdEdWxnvdRB9XiO7c7UJrotjQg7XmGkMrX
         m+Lw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QAgOWnDm;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id i12si1598314lfo.5.2019.05.19.01.53.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2019 01:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lfipe-1graBI0w3O-00pLZP; Sun, 19
 May 2019 10:53:50 +0200
Subject: Re: Understanding NMIs and Intel x86-64 VMX Preemption Timer
To: michael.g.hinton@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <87722b75-7f3a-4aab-8b7d-421fdcb11620@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <b055f893-dfa4-d0ca-5399-32b1e413229a@web.de>
Date: Sun, 19 May 2019 10:53:49 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <87722b75-7f3a-4aab-8b7d-421fdcb11620@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4E3869b7MtDrNqyhb21X5+Hydf+aTYM4+JB5wQYyUW3mY30MKbv
 zWSLqjNm48Iizu+QrovmuiBnnDARhKA7kzE0HE/1SsxCy9uS7L3c+UV4peWbSQB2iogrHGM
 TyuB33Nib3PQ268njf1FGX5Hy+6amc39HN8j46OdM5nrtUn2eN95myDm5VGKFpKGpXDaIlK
 yG8GTDAO1EbEYYptKeFyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4JhM1lHXeLU=:cApzEg6afjzVV2+kSUUgJI
 8wv/kaR7Lvf5BVQzvttDoHtQ2HQGdYZyOgPcrJUiKM1xYb7VZ9DZPNe9GlIOEHs/snUa8aJhT
 joLXZPn2cxWXV03lWzBefAU5Q1fwxfn5rfXrj+XCf0r8Wxb7ttkcamBWr4g7+Upe6spq3sD0g
 myMHMSPPY6beOwoI7Gf+LL3RbKEkDF5OBteprgmSwSBhnwQtaRaa47OF1SXu1FlNoF6yM7rKy
 OM2RZ/pr59HhjxtBTu1137dc10csVHg/ZgKU7B7B2ISPzzIe22N2m57aiMWOF2ITPD5/WYjUj
 i1q6JUdNnYSX59dFVGSU31NydTVb2PWUhdJOZaCFBphZ7lCl0XVB4dESW6DuC78VHi5ZhQX5l
 C3KXFG/vTzcoKpSAhKSfGs5ZCiQBkmTbCYZnnr61GW65eKCX3VF+ZHn0O0EZ4uoHZ0o+rrFE8
 8P1L88prizdjKmwUzX61sjassQA3bqXseoU0aFLzJzsybyQUZjImaGS4W0B4F/c9NNDIDIFgz
 ZzrUBW4enu2beRjEPk8riB1OiuIcuwcAyw83BIz/ox403Jqbvg4W0Vp/mMVJ2DgsE8W0TQWJo
 f2/O27KCnT+vEhATyjpVyZjeyk5SRNdoTMqJsaQ5FO3jfWOcEgCXzxu55y5479xE3d7Hemfsu
 OQHzrhdr/Vd7sGT8YrGTTjK49cwOrU4Si6SfBfaT5rWdiOt404z/zQGWxNUSpQdIftM8yQYvo
 bMgXc/bfFbyaaUmkDgriHql6vEZvd+IfHeL8qdiF4V1icdW3GeLJXeD7gIgv4/daGcic8p2Vf
 59ZCAzXz4Y1xSK+lGYWhmGJzSy/F5m5GJcPG06C4BS+RdMleonrj4A4kldA4VrMtxo+2R+WN4
 wFnyCvZS2jhV0vKfcBNexbDQW9wwVcpTEpUeQWESVp5mINVyQx5P+X5f1PkyU2Lsofuvw779x
 MK7hyjRL+gBS98EUxY/Mv7IJ0AW3zfS+hIpFQiuCWE7vDL4ISyLL+
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=QAgOWnDm;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 19.05.19 02:40, michael.g.hinton@gmail.com wrote:
> Hello,
>
> As part of my research, I=E2=80=99ve been looking to modify Jailhouse sli=
ghtly to take advantage of the preemption timer provided by VMX for Intel x=
86-64. I know Jailhouse already uses it, but I was hoping to also use it to=
 have the root cell periodically =E2=80=9Ccheck up=E2=80=9D on the inmate (=
the intended use case of the preemption timer). I guess it=E2=80=99s simila=
r to this topic, but for x86, not arm: https://groups.google.com/d/topic/ja=
ilhouse-dev/F074sQtFvao/discussion
>
> Reading the 2014 LWN Jailhouse article, I found this paragraph:
>
> =E2=80=9CCurrently, NMIs can only come from the hypervisor itself which u=
ses them to control CPUs... When NMI occurs in VM, it exits and Jailhouse r=
e-throws NMI in host mode. The CPU dispatches it through the host IDT... It=
 schedules another VM exit using VMX feature known as preemption timer. vmc=
s_setup() sets this timer to zero, so if it is enabled, VM exit occurs imme=
diately after VM entry. The reason behind this indirection is serialization=
: this way, NMIs (which are asynchronous by nature) are always delivered af=
ter guest entries (VM entry).=E2=80=9D
>
> So I have a few questions about this:
>
> * What does =E2=80=98serializing NMIs=E2=80=99 mean?
> * Why is that important?


Like most hypervisors, Jailhouse tries to intercept as little of the guest
activities as possible. On x86, this means that we do not root interrupts t=
o the
hypervisor first but rather let them hit the guest directly. They are actua=
lly
blocked while the hypervisor is running.

But we need some event so that CPU 1 can inform CPU 2 that there is somethi=
ng to
do in hypervisor mode, e.g. to stop a guest. For that purpose, we intercept
NMIs, which are separate events on x86. But NMIs are usually non-maskable. =
Thus,
they may not only hit the guest and lead to a vmexit, they may also hit us =
while
in host mode. On AMD, we can actually block them (cgli), but Intel does not=
 have
an equivalent feature.

Now, we could simply process the NMI reason on Intel in the NMI handler. Bu=
t
that would significantly complicate the state machine. It's much easier to =
only
react on vmexit reasons. And now the preemption timer comes into play: The =
NMI
handler only ensures that an NMI event is translated into a follow-up vmexi=
t,
right after the next entry - as if the NMI hit us in guest mode.

> * How does Jailhouse reinject/deliver the NMI to the guest?
>

We ignore all NMIs targeting the guest, in fact. That's mostly harmless, bu=
t it
breaks perf & Co. Could be fixed, but it's neither simpler nor was there an
urgent need so far.

> This is my current understanding of the code:
>
> 1) NMI occurs in guest, causing a VM exit.
> 2) vm_exit --> vcpu_handle_exit() --> vmx_handle_exception_nmi()
> 3) asm volatile("int %0" : : "i" (NMI_VECTOR));
> 4) nmi_entry --> vcpu_nmi_handler() --> enable preemption timer
> 5) vcpu_nmi_handler() returns
> 6) nmi_entry returns
> 7) vmx_check_events() --> disable preemption timer, x86_check_events()
> 8) vmx_check_events() returns
> 9) vmx_handle_exception_nmi() returns
> 10) vcpu_handle_exit() returns, (triggering a VM entry?)
>
> There must be a VM entry somehow between steps 4 and 7, or else the preem=
ption timer would continue to be disabled after step 10 and would never tri=
gger (but it does). So where is the VM entry?

There is none in your case. As described above, the preemption timer comes =
into
play when the original vmexit reason was not NMI but something different. W=
e
only get one reason per exit, and the NMI hitting is in host mode will not
trigger a second reason - unless we play the preemption timer trick.

>
> Also, I don=E2=80=99t understand how this serializes the NMI, because I d=
on=E2=80=99t see how the host delivers the NMI interrupt to the guest. Step=
s 2-10 are all on the host, correct?
>

As explained above, there is no NMI delivery to the guest as this point.

So, regarding your additional use case for the preemption timer: If you sta=
rt
using it for two purposes, you must ensure that programming the timer is no=
t
causing it to tick longer than required. If there was a value programmed th=
at is
supposed to trigger immediate exit on next entry, this must be preserved.

Here is a possible pattern to achieve this: Whenever you program the preemp=
tion
timer with a larger timeout than 0, check if there is already an immediate =
exit
pending. However, this has to take into account that you cannot make the
conditional writing atomic /wrt the NMI handler. So the NMI handler should =
also
set some this_cpu_data()->immediate_exit flag and write 0 into the timer. T=
hen
the site trying to program a larger timeout can do the following:

	vmcs_write32(VMX_PREEMPTION_TIMER_VALUE, timeout);
	if (this_cpu_data()->immediate_exit)
		vmcs_write32(VMX_PREEMPTION_TIMER_VALUE, 0);

By checking after writing a non-zero timeout you ensure that you reliably
restore any zero timeout that might have been written by the NMI handler ea=
rlier.

HTH,
Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b055f893-dfa4-d0ca-5399-32b1e413229a%40web.de.
For more options, visit https://groups.google.com/d/optout.
