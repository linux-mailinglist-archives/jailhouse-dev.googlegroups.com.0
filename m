Return-Path: <jailhouse-dev+bncBDX3XUVNVULBBMGRQCRQMGQEU2MZIYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93a.google.com (mail-ua1-x93a.google.com [IPv6:2607:f8b0:4864:20::93a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E230701AEC
	for <lists+jailhouse-dev@lfdr.de>; Sun, 14 May 2023 02:17:54 +0200 (CEST)
Received: by mail-ua1-x93a.google.com with SMTP id a1e0cc1a2514c-780d1c6574csf43416415241.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 May 2023 17:17:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684023473; cv=pass;
        d=google.com; s=arc-20160816;
        b=zn51vzEv6yY3FbHXprCXVSoaWOvgy1HQep0J9VNwl9nXqSAu7tURwo8oBml98dtqET
         fgWkjUsG6pWKCBh86VM56oey8oMc7vIcuhPPXiOkmL9Akzt44rs3lwwI5MOi+H3TJ9fV
         X2nDc9bwOlCW2aPSBCd0VFKffld4AbO/PNDmcDq6U/HTJ2G39nqYyU7nB2fpF4fFi2Qk
         8vCX05nMjSANOfJi+WIPA1+7cWwuc3McLsvve7YvmtSO0Rcu5Ku0/zWVzHY8aGtv84iL
         ZhVbi5E4AMrn8WHfoHy9CWnmiD+bnXlPYrCUFG6vC/c43miSJEAZ8dDnSHKl48gbcaCM
         ULvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=dHygrV8iID0Fdc6OeRlJGpXs4B4LqzsaiyLAn5htx6E=;
        b=bd/5u/c4AqnGvYYUWyRjy0Q0j2o26QuT6A15qowccuPNnAaDo/hkHRDLc/nJEysS6H
         S9tFWVJiiQNSmgqxL4VveDtHdtEKMoz8IqWreq2j56/V4UPpnjaurVGzVbFuz0WFFA0S
         P3dfk/ALhkQIV2tP6ovUNAL7BCi5Lu6VVxHJDHRqX9h2T4kq0bdTLDiGIT5rAsiyZ2DD
         BHQMa2JXklc0kyewTCCDwT27UM4Sfucx353P3/z7YVQggm/zwo/qcSd47rrrO+YH/TmQ
         Ist8eivfaoRDmdn4IEW1UotYFWWOm33bNSD6plkBqEL4uz4zFe+ll0g2wKiShtLE6G6N
         wQug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=dCQR1Z5u;
       spf=pass (google.com: domain of kurtzou@gmail.com designates 2607:f8b0:4864:20::62c as permitted sender) smtp.mailfrom=kurtzou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684023473; x=1686615473;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHygrV8iID0Fdc6OeRlJGpXs4B4LqzsaiyLAn5htx6E=;
        b=kDwM22FPvPdd7rz2QMuvzOoTIvJ2ooPGJ1x6QrobJ2qsLzJ2ZQIJJyYLaY6ogNqZPx
         9R2ILYFqfFcwGDCrgq8MMdAGh7CFN2MswOhJOf2MsAhlykwpo9bSVYhOTK3omloUoRnn
         UJN+OzmI5ORy3YPa18Kmxx4MSn+/ZEBL3Haaz0muH6+F1Z9UAxny3S33++uKcSx+2QKn
         MrGSCF3/1PzwgmlFcay5u2lJl4/yrKo9lAUKRg8n8IN4KHiInaeVUbVqCKtyb1BwuuO2
         2epaw+XVNWS5bJLQ+xZ0N2SDZr2PSB2p/QJGLFOu2K0N6FJfBfB4EyQ/o16vcbGVcXfz
         BhmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684023473; x=1686615473;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dHygrV8iID0Fdc6OeRlJGpXs4B4LqzsaiyLAn5htx6E=;
        b=ZGQhHGzvVuUTy6NQ0xDnC5D6+SRZdMWTS57iurYphUXWFqwtUPG94FNfVq9PZ8SvGn
         YzRDCvwu+FfehWFY/PW+3wNZr2E862HIu7M20ZyznzblNnDr7bJGeCQuzKEZZzOob16g
         uQqzzYxoQmkSKIZNeKSBJW4jSSVdlLx04icWO/EHI3CR4UAJuCj4HKatYmFHcrZBE56Y
         diVVqwTdiWN8m8fh66WSeJoEvYM2mAsve2htVrAnf84O8F3ZJPZBMpDdJCfGBWJoBAXR
         HO3s/UBTuvD1vEmtTGMcm59zuPCQ76hzlZxNows84yNeW5uBGSLFZQDWKhn2YAeiM3/n
         xFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684023473; x=1686615473;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHygrV8iID0Fdc6OeRlJGpXs4B4LqzsaiyLAn5htx6E=;
        b=WTaYHY6+edwzObta8Sn2/0OeIVQcYr0s7XY6Yx9iIg30k7IX2N7jZ3R0ZfR82y2ygV
         ByNpdFaFf1hQ0Twa1IgQM5UyIDQ8CJz7P1Gxz2iuW1imXJQlrBSmIiEReF4W/x5yY2z+
         wsqgGotsM2i1gioYtcjzhVpe9pqkcmSWLbOZW8cbS7gkqdLTTnTQQ8o+oepa0kNwTWCT
         l/MFSHeNPk0u/lchgTxP0fMjjwbC7761B18xQGmOyMvoNmNc9rTO2l8nFhLmlzfnyiwK
         fvS8IsCKjQzjDydaAxdQUS+S6X+O8vidbvXF3PFHxcd3gzV9T9LqSLr9ODp4vpsLyosk
         wOQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxpdHDClcBXCAQ2mnWeIXMeTjq67fDBMckNMFjoIwmL1bIB1KHN
	BaGwG1l/PcH2NFyf7pm9T0U=
X-Google-Smtp-Source: ACHHUZ4N/hujQ9LTq4Rbol4FSZNlkqIxSoFA4gUYwTF9yaDokZXO2so/7maB8HDPsQ9kxptIk+EXHw==
X-Received: by 2002:a1f:b4d3:0:b0:452:d66a:84b0 with SMTP id d202-20020a1fb4d3000000b00452d66a84b0mr12180284vkf.0.1684023472982;
        Sat, 13 May 2023 17:17:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6102:3e13:b0:436:2988:38f9 with SMTP id
 j19-20020a0561023e1300b00436298838f9ls2285164vsv.10.-pod-prod-gmail; Sat, 13
 May 2023 17:17:52 -0700 (PDT)
X-Received: by 2002:a05:6102:382:b0:436:160e:9d56 with SMTP id m2-20020a056102038200b00436160e9d56mr8119793vsq.10.1684023471951;
        Sat, 13 May 2023 17:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684023471; cv=none;
        d=google.com; s=arc-20160816;
        b=YG6ZIhYDIurnz2dt2Z9Z2krLwJphEN+1k7JwrbAZAGRYq+bGai/kG5xN71jqoC9Z2T
         OHT49jOkzQrvB1E7LHydBEG6fcUbk+4V75mrvIqvRuRfC7+NyjytLSRfq265/PThI4Mu
         SQ07g+fxgCDQIAfbjgMR8I2H5xe7MCbborLW+R3VrC51XFzSfP5UlW4sNn0DzyEf1rjl
         OzWgq6bo6XYBwB8udi7d2Qd/FKaZePQ/VKohanDFx2pZr0dZg9CvjZZjOTyIjW7LtnIp
         Jwz38MJI3UAzIV5MBsRtK78OjJImov2UjPusNOw88B6sx6+6YDFyNo/1lNrDGmcGzLeE
         NN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BgNJfEQKeYS2qlNAlIvnqnQs5rWBMZaDPKD+GP05sGI=;
        b=0D07IIKmYif7LUe4LCBwO7lgHns+kdN0p6aAVLtev1naTFXx6c4BHmYkHzztUAQCjQ
         xvX4RtzuDbGlMWZKbsL+jR0K9nRapkbbqyqEtKOcotcfStWYFU0DxX/i+Ao8nIDtXaEU
         Ml183kwstqiKIjFubgkTkrDc8KomW5YyW7MaDUQgqjwQ3Pjru+O8SBdTMItU4CP5f8Wc
         2ANdJaaLLRBkRpuMYE4pLdMQzgOnrVaO0PwBRlYidvd41DHYNrU9hjpRyIR0p+LHqPch
         FY6tmcabXT2bnnaFA3yF3BVNmFMEi9tVccUCjZOughe7cQWml1NO6lVoSiPfyrRy2LsM
         hJVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=dCQR1Z5u;
       spf=pass (google.com: domain of kurtzou@gmail.com designates 2607:f8b0:4864:20::62c as permitted sender) smtp.mailfrom=kurtzou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com. [2607:f8b0:4864:20::62c])
        by gmr-mx.google.com with ESMTPS id a33-20020ab03ca1000000b007836a48d143si715128uax.1.2023.05.13.17.17.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 17:17:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of kurtzou@gmail.com designates 2607:f8b0:4864:20::62c as permitted sender) client-ip=2607:f8b0:4864:20::62c;
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1aad5245632so81162935ad.3
        for <jailhouse-dev@googlegroups.com>; Sat, 13 May 2023 17:17:51 -0700 (PDT)
X-Received: by 2002:a17:902:bf0b:b0:1ac:3780:3a76 with SMTP id
 bi11-20020a170902bf0b00b001ac37803a76mr25320167plb.4.1684023470804; Sat, 13
 May 2023 17:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAC5TEnFx_TOr7ktks4qNSqL_bhv2P7r+fMOpbuz9B217jZNn5g@mail.gmail.com>
 <09045e94-f35b-53a6-93e4-8a1edd8e099e@siemens.com>
In-Reply-To: <09045e94-f35b-53a6-93e4-8a1edd8e099e@siemens.com>
From: Kurt Zou <kurtzou@gmail.com>
Date: Sat, 13 May 2023 21:17:39 -0300
Message-ID: <CAC5TEnHad5oZoP3H2TxVKPmeJ1pW=BAMQJFRGwZTrST2oQh7KQ@mail.gmail.com>
Subject: Re: ARM: ivshmem virtual PCI device doesn't show up
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000c5530205fb9c44b7"
X-Original-Sender: KurtZou@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20221208 header.b=dCQR1Z5u;       spf=pass
 (google.com: domain of kurtzou@gmail.com designates 2607:f8b0:4864:20::62c as
 permitted sender) smtp.mailfrom=kurtzou@gmail.com;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000c5530205fb9c44b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan
Yes the kernel support CONFIG_PCI_HOST_GENERIC=3Dy option

I added some other options in the kernel config and now it works fine. To
be more specific:  CONFIG_USELIB=3Dy  and CONFIG_ARM_PSCI=3Dy
not sure how they are related but anyway the pci devices show up fine.

Thanks for the help



On Wed, May 10, 2023 at 7:32=E2=80=AFAM Jan Kiszka <jan.kiszka@siemens.com>=
 wrote:

> On 08.05.23 03:53, Kurt Zou wrote:
> > Hi All,
> > I'm trying to bring up a ivshmem net device on a cortex-A7 platform.
> >
> > After enabling jailhouse, virtual PCI devices seem to be added
> > successfully, but with "lspci" or "/sys/bus/pci/devices", I didn't see
> > anything there. Am I missing something? I assume that pci devices (even
> > virtual) should be able to show up in system.
> >
> > Here's the debug information:
> >
> > root@demo:~# jailhouse enable /etc/jailhouse/demo.cell
> >
> > Initializing Jailhouse hypervisor v0.12 on CPU 0
> > Code location: 0xf0000040
> > Page pool usage after early setup: mem 37/1770, remap 0/131072
> > Initializing processors:
> >  CPU 0... OK
> >  CPU 1... OK
> >  CPU 2... OK
> >  CPU 3... OK
> > Initializing unit: irqchip
> > Initializing unit: PCI
> > Adding virtual PCI device 00:00.0 to cell "demo"
> > Adding virtual PCI device 00:01.0 to cell "demo"
> > Page pool usage after late setup: mem 57/1770, remap 5/131072
> > Activating hypervisor
> > root@demo:~# lspci
> > root@demo:~# ifconfig
> > lo: flags=3D73<UP,LOOPBACK,RUNNING>  mtu 65536
> >         inet 127.0.0.1  netmask 255.0.0.0
> >         loop  txqueuelen 1000  (Local Loopback)
> >         RX packets 0  bytes 0 (0.0 B)
> >         RX errors 0  dropped 0  overruns 0  frame 0
> >         TX packets 0  bytes 0 (0.0 B)
> >         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
> >
>
> Is the virtual PCI host controller visible in the root cell's device
> tree (/sys/firmware/devicetree/...)? Does the root Linux kernel support
> it (CONFIG_PCI_HOST_GENERIC=3Dy, IIRC)? Do you have any error reporting o=
n
> the kernel log of the root cell?
>
> Jan
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAC5TEnHad5oZoP3H2TxVKPmeJ1pW%3DBAMQJFRGwZTrST2oQh7KQ%40mail.=
gmail.com.

--000000000000c5530205fb9c44b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jan<div>Yes the kernel support CONFIG_PCI_HOST_GENERIC=
=3Dy option</div><div><br></div><div>I added some other options in the kern=
el config and now it works fine. To be more specific:=C2=A0 CONFIG_USELIB=
=3Dy=C2=A0 and CONFIG_ARM_PSCI=3Dy</div><div>not sure how they are related =
but anyway the pci devices show up fine.</div><div><br></div><div>Thanks fo=
r the help</div><div><br></div><div><br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 10, 2023 at 7:32=
=E2=80=AFAM Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com">jan.ki=
szka@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On 08.05.23 03:53, Kurt Zou wrote:<br>
&gt; Hi All,<br>
&gt; I&#39;m trying to bring up a ivshmem net device on a cortex-A7 platfor=
m.<br>
&gt; <br>
&gt; After enabling jailhouse, virtual PCI devices seem to be added<br>
&gt; successfully, but with &quot;lspci&quot; or &quot;/sys/bus/pci/devices=
&quot;, I didn&#39;t see<br>
&gt; anything there. Am I missing something? I assume that pci devices (eve=
n<br>
&gt; virtual) should be able to show up in system.<br>
&gt; <br>
&gt; Here&#39;s the debug information:<br>
&gt; <br>
&gt; root@demo:~# jailhouse enable /etc/jailhouse/demo.cell<br>
&gt; <br>
&gt; Initializing Jailhouse hypervisor v0.12 on CPU 0<br>
&gt; Code location: 0xf0000040<br>
&gt; Page pool usage after early setup: mem 37/1770, remap 0/131072<br>
&gt; Initializing processors:<br>
&gt; =C2=A0CPU 0... OK<br>
&gt; =C2=A0CPU 1... OK<br>
&gt; =C2=A0CPU 2... OK<br>
&gt; =C2=A0CPU 3... OK<br>
&gt; Initializing unit: irqchip<br>
&gt; Initializing unit: PCI<br>
&gt; Adding virtual PCI device 00:00.0 to cell &quot;demo&quot;<br>
&gt; Adding virtual PCI device 00:01.0 to cell &quot;demo&quot;<br>
&gt; Page pool usage after late setup: mem 57/1770, remap 5/131072<br>
&gt; Activating hypervisor<br>
&gt; root@demo:~# lspci<br>
&gt; root@demo:~# ifconfig<br>
&gt; lo: flags=3D73&lt;UP,LOOPBACK,RUNNING&gt; =C2=A0mtu 65536<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet 127.0.0.1 =C2=A0netmask 255.0.0.0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 loop =C2=A0txqueuelen 1000 =C2=A0(Local Lo=
opback)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets 0 =C2=A0bytes 0 (0.0 B)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX errors 0 =C2=A0dropped 0 =C2=A0overruns=
 0 =C2=A0frame 0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets 0 =C2=A0bytes 0 (0.0 B)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX errors 0 =C2=A0dropped 0 overruns 0 =C2=
=A0carrier 0 =C2=A0collisions 0<br>
&gt; <br>
<br>
Is the virtual PCI host controller visible in the root cell&#39;s device<br=
>
tree (/sys/firmware/devicetree/...)? Does the root Linux kernel support<br>
it (CONFIG_PCI_HOST_GENERIC=3Dy, IIRC)? Do you have any error reporting on<=
br>
the kernel log of the root cell?<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Technology<br>
Competence Center Embedded Linux<br>
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
om/d/msgid/jailhouse-dev/CAC5TEnHad5oZoP3H2TxVKPmeJ1pW%3DBAMQJFRGwZTrST2oQh=
7KQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAC5TEnHad5oZoP3H2TxVKPmeJ1pW%3DBAMQJFRGw=
ZTrST2oQh7KQ%40mail.gmail.com</a>.<br />

--000000000000c5530205fb9c44b7--
