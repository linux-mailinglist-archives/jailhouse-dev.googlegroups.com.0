Return-Path: <jailhouse-dev+bncBCFZVI4UTIEBB4NQWPUAKGQETK23UBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 993494E8B1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 15:15:30 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id a8sf2830505oti.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rFsWNBJa72j89TJv43yauF7B+/AEwt0yPl3TkIXsENU=;
        b=qRxc1YEYqLik4Yl5/zOtH3fpzJSmP0x1H6y6F8z4PACm1sEzITeEVnIFO91ETWB3vb
         uVo2DlijF/vINaZSxWGGVbFg+WXAVPgBSkf3YtEKTV6tsdfomb6QVz7Z13PVv6d1JDAC
         1ceB2cjDTHGP5ISnMvOaaeqGlKiyb4qhzry9KRX3OiFPNtfYhRyykAJc8hXwFyLRiPS2
         lNsMT8LGXnL7I5Vxb1+aHYM4KgneBaiy4mF0xZt88nnNATX2V8cfhKTJ9whDoKJDZasC
         mh72mtwjAtbykjycawOvyTqyrOp/u24bv1Coi46ADhW4QBI2ML38NPZxYQRGRlyeAPfw
         aV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rFsWNBJa72j89TJv43yauF7B+/AEwt0yPl3TkIXsENU=;
        b=mOIN7WoLb7zVsFOSdqmGFf1sO/HnK6JEem61KvI/9vqqjA60PJ0JPEJuWOT678VHym
         CJbHeS683Enfr9acIpYGPDOglc82fUIraFwxZVjJesABhdXoSEg1u7nqWLSmkyJbVAKz
         MNQRB0CJt1BWNM9qilwIuWkPtKqizzSa9znrL5sggck/rvgAMttTDE+AS936o7Y7xHm/
         V3lKpVDkbc2xuSxX1jtvn8FIqGdnlv78s/HRl7n9fKk7nrnYAwCge4/CahifKrSamKuU
         qwkqfwY0q0ukaB1AozsgVUK00tXbZNNde47LmuQVPWvCpfbCBPruLMB9aKW7vro/yFe0
         yP+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXkHKq+94JGJBZnHdMIUsAEFyRn0GBAtMQA8dp/JEKmuz7vNvI/
	B0A7rzRx6aC+XOahPvD4IDk=
X-Google-Smtp-Source: APXvYqwSPz73Fgw8SneQNmIS8ewLTmllX1rGjxh0+gSFesEcAVoGHpsa1uyWzBhtog1/Vu0vJgDqQQ==
X-Received: by 2002:a54:4694:: with SMTP id k20mr2681157oic.136.1561122929277;
        Fri, 21 Jun 2019 06:15:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:3fc3:: with SMTP id m186ls1374700oia.15.gmail; Fri, 21
 Jun 2019 06:15:28 -0700 (PDT)
X-Received: by 2002:a54:4694:: with SMTP id k20mr2681125oic.136.1561122928766;
        Fri, 21 Jun 2019 06:15:28 -0700 (PDT)
Date: Fri, 21 Jun 2019 06:15:27 -0700 (PDT)
From: Adam Przybylski <adamprz@gmx.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7c4190ba-977a-4426-8cea-dc32dc77737c@googlegroups.com>
In-Reply-To: <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
 <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
 <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_173_659451506.1561122928028"
X-Original-Sender: adamprz@gmx.de
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

------=_Part_173_659451506.1561122928028
Content-Type: text/plain; charset="UTF-8"

Am Freitag, 21. Juni 2019 14:51:34 UTC+2 schrieb Ralf Ramsauer:
> Hi,
> 
> On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:
> > Hi Adam,
> > 
> > On 21.06.2019 17:16, Adam Przybylski wrote:
> >> Dear Jailhouse Community,
> >>
> >> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
> >> Processor. Unfortunately the system hangs after I execute "jailhouse
> >> enable sysconfig.cell".
> >>
> >> Do you have any hint how to debug and instrument this issue?
> >>
> >> Any kind of help is appreciated.
> >>
> >> Attached you can find the jailhouse logs, processor info, and
> >> sysconfig.c.
> >>
> >> Looking forward to hear from you.
> > I'd say the following line is the culprit:
> > 
> >> FATAL: Invalid PIO read, port: 814 size: 1
> 
> Could you please attach /proc/ioports? This will tell us the secret
> behind Port 814.
> 
> > 
> > As a quick fix, you may grant your root cell access to all I/O ports and
> > see if it helps.
> 
> Allowing access will suppress the symptoms, yet we should investigate
> its cause. Depending on the semantics of Port 819, to allow access might
> have unintended side effects.
> 
> You could also try to disassemble your kernel (objdump -d vmlinux) and
> check what function hides behind the instruction pointer at the moment
> of the crash 0xffffffffa4ac3114.
> 
>   Ralf
> 
> > 
> > Best,
> > Valentine
> > 
> >>
> >> Kind regards,
> >> Adam Przybylski
> >>
> >

Hi,

thank you for the fast response. Attached you can find the output of "/proc/ioports".


I assume this is the relevant part:

03e0-0cf7 : PCI Bus 0000:00
  03f8-03ff : serial
  040b-040b : pnp 00:05
  04d0-04d1 : pnp 00:05
  04d6-04d6 : pnp 00:05
  0800-089f : pnp 00:05
    0800-0803 : ACPI PM1a_EVT_BLK
    0804-0805 : ACPI PM1a_CNT_BLK
    0808-080b : ACPI PM_TMR
    0820-0827 : ACPI GPE0_BLK

--
Adam

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7c4190ba-977a-4426-8cea-dc32dc77737c%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_173_659451506.1561122928028
Content-Type: text/plain; charset=US-ASCII; name=AMD-EPYC-ioports.log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=AMD-EPYC-ioports.log
X-Attachment-Id: 36a32d98-e9ad-4eed-acb2-331091abbcdb
Content-ID: <36a32d98-e9ad-4eed-acb2-331091abbcdb>

0000-02ff : PCI Bus 0000:00
  0000-001f : dma1
  0020-0021 : pic1
  0040-0043 : timer0
  0050-0053 : timer1
  0060-0060 : keyboard
  0061-0061 : PNP0800:00
  0064-0064 : keyboard
  0070-0071 : rtc0
  0080-008f : dma page reg
  00a0-00a1 : pic2
  00b2-00b2 : APEI ERST
  00c0-00df : dma2
  00f0-00ff : fpu
  02f8-02ff : serial
0300-03af : PCI Bus 0000:00
03b0-03df : PCI Bus 0000:00
03e0-0cf7 : PCI Bus 0000:00
  03f8-03ff : serial
  040b-040b : pnp 00:05
  04d0-04d1 : pnp 00:05
  04d6-04d6 : pnp 00:05
  0800-089f : pnp 00:05
    0800-0803 : ACPI PM1a_EVT_BLK
    0804-0805 : ACPI PM1a_CNT_BLK
    0808-080b : ACPI PM_TMR
    0820-0827 : ACPI GPE0_BLK
  0900-090f : pnp 00:05
  0910-091f : pnp 00:05
  0a00-0a0f : pnp 00:02
  0a10-0a1f : pnp 00:02
  0a20-0a2f : pnp 00:02
  0a30-0a3f : pnp 00:02
  0a40-0a4f : pnp 00:02
  0b00-0b0f : pnp 00:05
    0b00-0b08 : piix4_smbus
  0b20-0b3f : pnp 00:05
  0c00-0c01 : pnp 00:05
  0c14-0c14 : pnp 00:05
  0c50-0c51 : pnp 00:05
  0c52-0c52 : pnp 00:05
  0c6c-0c6c : pnp 00:05
  0c6f-0c6f : pnp 00:05
  0ca2-0ca2 : IPI0001:00
    0ca2-0ca2 : IPMI Address 1
      0ca2-0ca2 : ipmi_si
  0ca3-0ca3 : IPI0001:00
    0ca3-0ca3 : IPMI Address 2
      0ca3-0ca3 : ipmi_si
  0cd0-0cd1 : pnp 00:05
  0cd2-0cd3 : pnp 00:05
  0cd4-0cd5 : pnp 00:05
  0cd6-0cd7 : pnp 00:05
  0cd8-0cdf : pnp 00:05
0cf8-0cff : PCI conf1
0d00-1fff : PCI Bus 0000:00
  1000-1fff : PCI Bus 0000:01
    1000-1fff : PCI Bus 0000:02
      1000-107f : 0000:02:00.0
2000-4fff : PCI Bus 0000:60
  2000-2fff : PCI Bus 0000:66
    2000-201f : 0000:66:00.0
  3000-3fff : PCI Bus 0000:64
    3000-301f : 0000:64:00.0
  4000-4fff : PCI Bus 0000:61
    4000-4fff : PCI Bus 0000:62
      4000-4fff : PCI Bus 0000:63
        4000-40ff : 0000:63:00.0
fe00-fefe : pnp 00:05

------=_Part_173_659451506.1561122928028--
