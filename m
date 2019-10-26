Return-Path: <jailhouse-dev+bncBCDJXM4674ERBY5C2DWQKGQERBOCOWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F205E5970
	for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Oct 2019 11:27:00 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id a6sf2538144otr.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Oct 2019 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4QmS5ZahgJk/MS5HCJpOeeZ8GpC3b92Si/m0hxyPdn8=;
        b=Fa/CIgImR3Ew8oojCzgWE/tItoyQnOaPdDpp94+JsaQqZDVWklVNIIrpwJSBVNtliD
         b3DoGqYb+C0YEtvbOngGIBVUNsV/d7hyluK635b0M9p9gUXEWRv7yo7uu30oFMuTfy/x
         lFWVgotR/ELGdG0h/QigcTJxmvRmAx5eeB9tenqNgTNrukYIPsh/slcDEMVmgB2YbpVZ
         wHk821A6tHyYElSiNVDTFBrQC8y8GUVdmHwkFuUKANvoVHUBte26p1vSS+C2lvVkNRBD
         bit3+IMZ6J5BM/OSF2T7AqVTLQm5EnkflFxcbsfn/t+fRMWODTfaczu0+9sMDV+HNDmD
         GRZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4QmS5ZahgJk/MS5HCJpOeeZ8GpC3b92Si/m0hxyPdn8=;
        b=Jex3lA19r8w4oFm6i87/7LMM1FO9iTa71tdRGiq1BB5PvMw76FHzFjYB5SwvnPzElO
         A3W/paad3kFD313H4zWRnkl+aO31FnIk+toUDsJiw2liJilP03DyoPvDv/BaHw8RUDrK
         Dcd/B2GY7osz5Zj3KHwa0YtyNCAzHTX1/B49dEe1BFccEk8ZmDGfsgwkbF8nFsApYMVM
         axynNiVvQK6v222xwmsVTwnc5a+8TKcjDuadODXqtW3Au6gErpRDj0RS4vsaeHWDLF+j
         W+tWoJSnLYXGce1mqg/uIAD2XHQQDX9Ku6o2M9uFpwNvKcvMAJ/J+m9Gc5oaSsfJ7SdW
         JqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4QmS5ZahgJk/MS5HCJpOeeZ8GpC3b92Si/m0hxyPdn8=;
        b=P1bZ0slnRQ5ZnhMWlUtQs34MwJHzSnxlNCZkqoL22FOPayBqbjd/lt/k4CgGYvxQPF
         SuewbGZufJ2IwFUk/FDJjsJOCCaOH5tbXFCrGwu1bEzgmZ6RNo4UD9mVVrxpf7ihhJy4
         KwJYyfMmXHLOOWT7fw6aKKwasfJyr3iel7S4QmwuDXH33+3YUi76oXCX7llRY2hoMgkv
         DV7GpP+G1a8lKLynhznuER4i94w6evCdX9aZoqFEF7ZVQR+ozZxWw5tMXr2+0OLlpClW
         EJDgpQhxA9/Gsl2HxqE++kyi+6GzUfETuN4agRyQLqp5S9tuLNGQRcfTwDDi6f6lyt8V
         z7+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUucPiHg9kWHF3ZUlnQVnMdOSWw8zpQ7tWFAZmxJqxN2tLpCPI0
	1EYxQuJayuagRHE4hMu5Zuk=
X-Google-Smtp-Source: APXvYqw0QrpTuhtHmD12BbsT+aCKxFVJNLdl3lWasB/I2MIR/8AFguieEuf2zzM8yS8g8NO8pozRqw==
X-Received: by 2002:aca:3242:: with SMTP id y63mr6360539oiy.114.1572082019164;
        Sat, 26 Oct 2019 02:26:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7455:: with SMTP id p21ls105269otk.10.gmail; Sat, 26 Oct
 2019 02:26:58 -0700 (PDT)
X-Received: by 2002:a9d:303:: with SMTP id 3mr6317139otv.128.1572082018539;
        Sat, 26 Oct 2019 02:26:58 -0700 (PDT)
Date: Sat, 26 Oct 2019 02:26:57 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c03e237a-78c1-4169-9d2d-104e34754cd2@googlegroups.com>
In-Reply-To: <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
 <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
 <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
 <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
Subject: Re: v0.9 vs v1.1 interrupt latency raise
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_601_1773780260.1572082017830"
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

------=_Part_601_1773780260.1572082017830
Content-Type: multipart/alternative; 
	boundary="----=_Part_602_2002590464.1572082017830"

------=_Part_602_2002590464.1572082017830
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm not sure if this is relevant in this case, but I have noticed that on 
Intel x86-64, if hardware p-states (HWP) are enabled in the CPU (which they 
are by default if the CPU supports it), this introduces frequency scaling 
coupling between cores, even when the cores are isolated in separate cells. 
So you get this unexpected behavior where an inmate with 1 core will run 
*faster* if the other cores are very busy, and run a lot slower if the 
other cores are all idle. This is because the CPU itself does the frequency 
scaling automatically in hardware and doesn't know anything about what 
Jailhouse is doing.

Passing intel_pstate=no_hwp to the Linux kernel command line disables 
hardware p-states and gets rid of this coupling as far as I can tell. It 
appears that HWP is a relatively new feature (last couple of years) in 
Intel CPUs.

-Michael

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c03e237a-78c1-4169-9d2d-104e34754cd2%40googlegroups.com.

------=_Part_602_2002590464.1572082017830
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m not sure if this is rel=
evant in this case, but I have noticed that on Intel x86-64, if hardware p-=
states (HWP) are enabled in the CPU (which they are by default if the CPU s=
upports it), this introduces frequency scaling coupling between cores, even=
 when the cores are isolated in separate cells. So you get this unexpected =
behavior where an inmate with 1 core will run <i>faster</i>=C2=A0if the oth=
er cores are very busy, and run a lot slower if the other cores are all idl=
e. This is because the CPU itself does the frequency scaling automatically =
in hardware and doesn&#39;t know anything about what Jailhouse is doing.</d=
iv><div><br></div><div>Passing <font face=3D"courier new, monospace">intel_=
pstate=3Dno_hwp=C2=A0</font>to the Linux kernel command line disables hardw=
are p-states and gets rid of this coupling as far as I can tell. It appears=
 that HWP is a relatively new feature (last couple of years) in Intel CPUs.=
</div><div><br></div><div>-Michael</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c03e237a-78c1-4169-9d2d-104e34754cd2%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/c03e237a-78c1-4169-9d2d-104e34754cd2%40googlegroups.com<=
/a>.<br />

------=_Part_602_2002590464.1572082017830--

------=_Part_601_1773780260.1572082017830--
