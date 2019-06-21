Return-Path: <jailhouse-dev+bncBCFZVI4UTIEBBJ6OWPUAKGQE4STPDRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DEA4EA69
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 16:18:16 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id f36sf2922932otf.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Jun 2019 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vn2Kf1HkZrEq9nLuuFnwJU/yHeGuera9sns+Gky8cao=;
        b=szhxNdB5rLkLzJrD50p+7PkvPfTuiT3bJp3r96lFgRxmzger97mh5DPrCz/ghVKzlz
         qM8bWja0LDjYEiaCRdWAw8gt5m3qHhd8QqCp/DFKbWId+WJer5ROc2poA1yl0GJcSoAk
         0Q7fCGJLonD9ScUe4CHn3Jwmmxl0nMDM9kVp0uKekNjYzQpqIK9Jt5DWzaW+w3nIZhb3
         qzsybQAYNL8Q/ZuWL4p7NkGV7Kd2jUkiDErMpp03RHw3huT+tq6K/JZyHMLKS+55KQno
         MnTlkb8d0aWMQOSW9u0/fBbrFucL7/491C0zDPlESjIWP4mdgWen5XDdLIgWQW6TxVdH
         hHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vn2Kf1HkZrEq9nLuuFnwJU/yHeGuera9sns+Gky8cao=;
        b=lAwW/vCwaRHGPtw4P6Ny3h/3+E9+547lzRgGBCEbbvUxxad5RyTLMPgTF6dr17xuW2
         GUhzezeDOTDLIJkayuyykbLMJlUAvAfIqOryh1fsnxWYwJ6Ppt4YAr4XVUr615Zk69I0
         Vgwe3vVbkdj7jSM6soHaYW7+NNA2+T5QTuVpcJjq5sjmsfviKkZ+cHV39HyaxTuTExx9
         8aJq301DnipbLvWBYvX/l/JaPYziRPmK5uEhKkymFz/x8zpak2HWJA94ihGx2Mh6EbsI
         JqSO+01nHZFlknaoAgoc7A7DlrftwlvhCujXwAg8nQCt8gHVt7n0MhlIik8aHSsCl8gh
         JFsg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWE5n/WegFcxML9FIm68/4ZZ9xb8Hje8Ez16lKSk6j5cgN4W5mx
	izgHCoD7VZ7efY6/1+bZavY=
X-Google-Smtp-Source: APXvYqx/pMbxgpDJTBTSyxCIJLIh5pImaVzPUCs4h8GrzT367ev5gaRMn5GAFrgLrxe8lF5y7YvSNg==
X-Received: by 2002:a9d:71cf:: with SMTP id z15mr5736955otj.21.1561126695852;
        Fri, 21 Jun 2019 07:18:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5015:: with SMTP id e21ls1366724oib.16.gmail; Fri, 21
 Jun 2019 07:18:15 -0700 (PDT)
X-Received: by 2002:aca:c584:: with SMTP id v126mr2903320oif.60.1561126695266;
        Fri, 21 Jun 2019 07:18:15 -0700 (PDT)
Date: Fri, 21 Jun 2019 07:18:14 -0700 (PDT)
From: Adam Przybylski <adamprz@gmx.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bc4047f6-c6c7-4b74-9084-51212c8bd4ad@googlegroups.com>
In-Reply-To: <20190621155406.18df2751@md1za8fc.ad001.siemens.net>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
 <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
 <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
 <20190621155406.18df2751@md1za8fc.ad001.siemens.net>
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_852_530559387.1561126694588"
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

------=_Part_852_530559387.1561126694588
Content-Type: text/plain; charset="UTF-8"

Am Freitag, 21. Juni 2019 15:54:15 UTC+2 schrieb Henning Schild:
> Am Fri, 21 Jun 2019 14:51:30 +0200
> schrieb Ralf Ramsauer:
> 
> > Hi,
> > 
> > On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:
> > > Hi Adam,
> > > 
> > > On 21.06.2019 17:16, Adam Przybylski wrote:  
> > >> Dear Jailhouse Community,
> > >>
> > >> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
> > >> Processor. Unfortunately the system hangs after I execute
> > >> "jailhouse enable sysconfig.cell".
> > >>
> > >> Do you have any hint how to debug and instrument this issue?
> > >>
> > >> Any kind of help is appreciated.
> > >>
> > >> Attached you can find the jailhouse logs, processor info, and
> > >> sysconfig.c.
> > >>
> > >> Looking forward to hear from you.  
> > > I'd say the following line is the culprit:
> > >   
> > >> FATAL: Invalid PIO read, port: 814 size: 1  
> > 
> > Could you please attach /proc/ioports? This will tell us the secret
> > behind Port 814.
> 
> Not always, the driver doing that has to be so friendly to register the
> region.
> 
> > > 
> > > As a quick fix, you may grant your root cell access to all I/O
> > > ports and see if it helps.  
> > 
> > Allowing access will suppress the symptoms, yet we should investigate
> > its cause. Depending on the semantics of Port 819, to allow access
> > might have unintended side effects.
> > 
> > You could also try to disassemble your kernel (objdump -d vmlinux) and
> > check what function hides behind the instruction pointer at the moment
> > of the crash 0xffffffffa4ac3114.
> 
> A look in the System.map can also answer that question. On a distro
> that will be ready to read somewhere in /boot/.
> 
> Henning
> 
> >   Ralf
> > 
> > > 
> > > Best,
> > > Valentine
> > >   
> > >>
> > >> Kind regards,
> > >> Adam Przybylski
> > >>  
> > >   
> >

Hi,

I looked up the function which gets executed in the Kernel. It's "acpi_idle_do_entry".

Adam

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc4047f6-c6c7-4b74-9084-51212c8bd4ad%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_852_530559387.1561126694588--
