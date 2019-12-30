Return-Path: <jailhouse-dev+bncBD7236HKXYJRBAFJU7YAKGQE2S4T46Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x238.google.com (mail-oi1-x238.google.com [IPv6:2607:f8b0:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E0612CEF8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 11:42:10 +0100 (CET)
Received: by mail-oi1-x238.google.com with SMTP id o5sf13963085oif.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 02:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yr7fcCsGF6xfnw2wzLkzcHmPwdiRLbk87o0mOG0RIqI=;
        b=nItqbg7QFDME4zMZD26dTt1Pufml8tK/3aN/4tkoAwwEFUdpkL2uMGQEDrF2FFVAK5
         P+FAkXRbXshjeqN4Ku1+fUuxaAo7QwbPXRbRKmKFSUP+TQiABIOhout14/tdcuxWj1M6
         LYg3WY5ut2rDnapV4JXhM3TCtxiMXXfwslHCcZA3fVo2lbqF1+3Vk21pIxaPK9e/8Xhh
         GN0QMRJbYI+Dfk0HmdUN+aOejUPOndbRQnTrsZeX4YwrUWUiNh/EtkHyLRmaUAVyke5J
         eN2JHD0QI91S/E6nBE2QI6dusTYE6SvN4sUIycITxo1d2bNmnS5md/zX1Qa9q3AkRE9G
         Gi8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yr7fcCsGF6xfnw2wzLkzcHmPwdiRLbk87o0mOG0RIqI=;
        b=FNjnBUpxcvsE1oYL9MDFJl20YFiEey7wv4ZqoUW9h9IJgnwa8Q5ngod+EQOOmI28Vp
         BTwVMsqoRBOmPy54eI9xHl+x2N32UZQKlJMhra4RVnyLsSZ39uYHDRZ0Lglb9bsuKKbe
         +B2E/ehFpEXbR11+7sa9OwRy4SfVangCKn8SOlOUoqOJggLOj3RvLWAyXpifaA/bHn9a
         5XGjkfqonQZn3vAnxU4eITNHhvn0E3mBISQyewIBWSc3Ntk+VE3d5ZnXwEFHPbHfCMRV
         FaiexF09Fm+8961Cg45tTnGilvtZrF+sSItA4hCmAGmr9u33Ruc3CO4opL9slzzJuD/5
         pnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yr7fcCsGF6xfnw2wzLkzcHmPwdiRLbk87o0mOG0RIqI=;
        b=c9eD/0bDpKyNWV5qZdLwOasWwi3LRrf48f3mzpIBDxHGtpH1xVCn3y6Bh2aCcbU260
         FXqXRFd4shg1Iqu1JZKrwIkpnZz1m0aa1TWz4OAUpMF8Al0Ffb5ZHMwEz2QxlIgr7XmN
         /7qSkvTT25a/ERoSTkpyT4cNGrz0fVnYcOVjaSPOG2KPomZYWo9xMPcnYbkZruHSitzG
         LuFFCuOAU3LReEKTWJCABJzOu477peV0CpjGU8gREr3tpccmD+W0N0Mi8GUzWzM24kT4
         d12HFvSIMxhzxLoPpuZtoZzjFcJvc8L8rzfTUoxaZNm5HIcxgXOUPY95wZECVWOya8Qf
         hLUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXVJ01TpH7KWZ+OVteuUWlsbaaEMPjk8y1jTqpXmwi+dW93pMGL
	guTQFP4ocrpkAydsUskBWGw=
X-Google-Smtp-Source: APXvYqzuBL2i+zTbzutVJFg/GW6GS4ojqFV+fxprH385UaRAsPKqOtt2/iQ0gOYyV1O/sdodbaGkbQ==
X-Received: by 2002:a05:6830:1385:: with SMTP id d5mr43662845otq.61.1577702528863;
        Mon, 30 Dec 2019 02:42:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7999:: with SMTP id h25ls10310057otm.2.gmail; Mon, 30
 Dec 2019 02:42:08 -0800 (PST)
X-Received: by 2002:a05:6830:1515:: with SMTP id k21mr57558461otp.177.1577702528383;
        Mon, 30 Dec 2019 02:42:08 -0800 (PST)
Date: Mon, 30 Dec 2019 02:42:07 -0800 (PST)
From: contact.thorsten@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a343e68e-1b20-4e30-92b3-9c43a5a5a3e1@googlegroups.com>
In-Reply-To: <1244a8aa-25d4-b475-9371-681939ebae8d@web.de>
References: <c6d8a14f-97c4-43f8-828d-679b08e14555@googlegroups.com>
 <4d491b38-28d8-a0ea-4cb1-1499957997bd@web.de>
 <590db4b2-f355-478c-83eb-fe2a3722739f@googlegroups.com>
 <1244a8aa-25d4-b475-9371-681939ebae8d@web.de>
Subject: Re: [jailhouse-images] qemu examples stalls to enable with -EIO
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2288_2033118557.1577702527690"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_2288_2033118557.1577702527690
Content-Type: multipart/alternative; 
	boundary="----=_Part_2289_314844567.1577702527690"

------=_Part_2289_314844567.1577702527690
Content-Type: text/plain; charset="UTF-8"

Am Sonntag, 29. Dezember 2019 17:51:00 UTC+1 schrieb Jan Kiszka:
>
> [..]
> Actually, I'm more interested in the feature set of the host CPU, not 
> the one QEMU presents. I strongly suspect, though, that it will be 
> equivalent to what the guest sees in this regard. 
>

I believe the issue with this processor model is only in regards to nested 
virtualization. I did run the hardware check directly on the host system 
and the flags come up ok (see attached)

However, the (unmodified) host Debian-Linux-Kernel *expectedly* locks up 
when I try to enable jailguard. To prepare a trimmed down setup would take 
me a little more time, so I rather spend it in the cosy qemu-world.

thanks, Thorsten


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a343e68e-1b20-4e30-92b3-9c43a5a5a3e1%40googlegroups.com.

------=_Part_2289_314844567.1577702527690
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Am Sonntag, 29. Dezember 2019 17:51:00 UTC+1 schrieb Jan K=
iszka:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8=
ex;border-left: 1px #ccc solid;padding-left: 1ex;">[..]<br>Actually, I&#39;=
m more interested in the feature set of the host CPU, not
<br>the one QEMU presents. I strongly suspect, though, that it will be
<br>equivalent to what the guest sees in this regard.
<br></blockquote><div><br></div><div>I believe the issue with this processo=
r model is only in regards to nested virtualization. I did run the hardware=
 check directly on the host system and the flags come up ok (see attached)<=
br></div><div><br></div><div>However, the (unmodified) host Debian-Linux-Ke=
rnel <i>expectedly</i> locks up when I try to enable jailguard. To prepare =
a trimmed down setup would take me a little more time, so I rather spend it=
 in the cosy qemu-world.</div><div><br></div><div>thanks, Thorsten<br></div=
><div><br></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a343e68e-1b20-4e30-92b3-9c43a5a5a3e1%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/a343e68e-1b20-4e30-92b3-9c43a5a5a3e1%40googlegroups.com<=
/a>.<br />

------=_Part_2289_314844567.1577702527690--

------=_Part_2288_2033118557.1577702527690
Content-Type: text/plain; charset=US-ASCII; 
	name=jailhouse-hardware-check.txt
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=jailhouse-hardware-check.txt
X-Attachment-Id: b3e8c432-7ac8-4497-aa96-a025b2c76a40
Content-ID: <b3e8c432-7ac8-4497-aa96-a025b2c76a40>

Feature                         Availability
------------------------------  ------------------
Number of CPUs > 1              ok
Long mode                       ok
x2APIC                          ok

VT-x (VMX)                      ok
  VMX outside SMX               ok
  VMX inside SMX                missing (optional)
  IA32_TRUE_*_CLTS              ok
  NMI exiting                   ok
  Preemption timer              ok
  I/O bitmap                    ok
  MSR bitmap                    ok
  Secondary controls            ok
  Optional CR3 interception     ok
  Virtualize APIC access        ok
  RDTSCP                        ok
  Unrestricted guest            ok
  INVPCID                       ok
  XSAVES                        ok
  EPT                           ok
    4-level page walk           ok
    EPTP write-back             ok
    2M pages                    ok
    1G pages                    ok
    INVEPT                      ok
      Single or all-context     ok
  VM-exit save IA32_PAT         ok
  VM-exit load IA32_PAT         ok
  VM-exit save IA32_EFER        ok
  VM-exit load IA32_EFER        ok
  VM-entry load IA32_PAT        ok
  VM-entry load IA32_EFER       ok
  Activity state HLT            ok

VT-d (IOMMU #0)                 ok
 Skipping MMIO tests, your kernel might have CONFIG_STRICT_DEVMEM enabled.
 Disable for thorough testing.


VT-d (IOMMU #1)                 ok
 Skipping MMIO tests, your kernel might have CONFIG_STRICT_DEVMEM enabled.
 Disable for thorough testing.


Check passed!
BUT: Some essential checks had to be skipped!


------=_Part_2288_2033118557.1577702527690--
