Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBJGTX3UAKGQEHLGM3HQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id D25AC4FCAE
	for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jun 2019 18:32:37 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id e13sf1635966lfb.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jun 2019 09:32:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561307557; cv=pass;
        d=google.com; s=arc-20160816;
        b=R3LClXyfta+7wDTiSyuIzVSHiGTOYpMrHISUzqjSLL4u9H3M3eoj3Z9tS/wlm9Yr5N
         9GLSg1J1RHTc+3Ev6h9X9sdFdnmoO5eiqTtkKtJz4zEqwz2eVGSL6HZ95Dm1qt5aokj0
         zxF1UsPyc/hJRGLiOzRekpD5RMIC528c2n5BIeaFv1r18MdhwlApDvakPD+n9l3F8Par
         de5FawyEFs+BXEj9Tf7ujCrLGbCUTglqkfHJi02OSfg0J4ruo/BpCsoSuMJnYmAOcJvn
         aUBXUvYeIoiAZ05Npcd1w93L/tRZB1gOL56o5Aj/mDZvB5wrPlGae6SHO7xXYTfQ0LzU
         etIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=D7YTVtkOXioCPgZrnCmT3HiT/HRKntsLu8XX5fyPGwk=;
        b=h43AthjIferaOLZpolMUTHKqrTCBzmal9G/5RgO7RFyVAeVv+8q+T3IopIgYwaoWmm
         0n4OTNPCFKFUtLXo5/GPLAFpJTghf9gKedsHWrGbgE/P+lBtP1GWJYIzqLAo2MuZwcte
         j6e4Ce7CqSrxpQ2cZqA1lz1N8yMPmOUjgVUbGLeI6FTUf8u6SOt8Q1y8Zvh1+htaHlA4
         JmaWWpasl9ZIYvIO9FoY7GqXicQJCLSl9iHjz0A1mS2yHAGVDchGX9UGU8P0LklIJOoq
         zp6wBUXq9vmka8XPzmlH99Y9RNpLyiEfXT2w++rrW+nBzcx4qxT1ap+xD/zpB/kVqYz+
         fJXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D7YTVtkOXioCPgZrnCmT3HiT/HRKntsLu8XX5fyPGwk=;
        b=h1xReh1gN7TiEgF4bguikT3Qxi1dYUscovJmD3NkaVpEeBwdT85e+qVPSGL2XQRDZO
         gkZsoYmogK5Afzd/R7D0g7tEUsPONo4hGRkwOuMytVsB/wGOHENzzoPYFAw7XgPwt8Lb
         GWeD0dRzpQW+M0VIFLLSDOn3rzKftEUUdoTO3bLWjisE2SCpGTvYhDc7iTlm4aNnzpKb
         ad/zd/22ti+3Ln4fKrcf/UypZrK6PE4ySZFsx/awdSvIQKSd0NZvPFmAVnycYTGaTMUw
         FNkqmMa3UBxj+izf0UrklAl8/WzON9H5ok2uSZRL2cdzlZyCJ6HYN0TPBVs19/Z3IIwT
         9VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D7YTVtkOXioCPgZrnCmT3HiT/HRKntsLu8XX5fyPGwk=;
        b=ITqkOOR2KnIsDLf58h+FPg2qV3+WcWpNUTygiKH0uGBJa4efIwgGdPP+T/bXxhN9gq
         Xz8UnsgJXQyVxBSLdgdlcKlAn7vnIQvgjHGDzx7vmaNiKNGVcBOceKti3mM8i+QuJpvE
         UILWJog5Imj+viSG9dI3hpRTRTUf+DRV7YZRwth1U4poQ3JEhsnqo2edD6HIK7sGqp+2
         V18aaox+JLUZa9BR0c/eWNhSbFuHB7tf3pXLlYAawZBOSFCbWDQOJli7hrc1wKEbxeTx
         W/0VQg5GxCigtCxiDUOv00KPOcov4rQvX9mf/ZMhNvj32VfZwbR3LC987mxzmCVBoa7T
         F1CQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU6dbVkDnFnUiedH0Sd08sXLnykT13NzMrYxHvOvVvNG+MlG7sQ
	/ltnb8NCue+mZYF8SbLhoIg=
X-Google-Smtp-Source: APXvYqwkQJsVql5PD+CwhpV5nv8rraNvcuUj7LwFyNaprv/Vn6q0sOcmAJNwP0codCMaNKhEFnFuQg==
X-Received: by 2002:a2e:9c19:: with SMTP id s25mr5552521lji.188.1561307557330;
        Sun, 23 Jun 2019 09:32:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6b10:: with SMTP id d16ls1195634lfa.10.gmail; Sun, 23
 Jun 2019 09:32:36 -0700 (PDT)
X-Received: by 2002:ac2:48a5:: with SMTP id u5mr68645555lfg.62.1561307556514;
        Sun, 23 Jun 2019 09:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561307556; cv=none;
        d=google.com; s=arc-20160816;
        b=bNfuNKk29vlyIA2BzoD+4YiXY8vk7T5vRGlxQMA5CBG4sddk9Iw/pjlRQE1yVGKYoR
         zO/tamE4GVXnB4utaQc8X5GuCUownJVTa7+HrbJAWOfm+owRqs7AzbQPw1NKmfNZnN7w
         PRTbhuRmGaSwqffd9FnDsedpJP7/22xLHmYuENXFu4cjb6HrHFCEj3jXp2zlLcv0bEbx
         JMRgktSlXQIp01vlY1P72+0XIWSmnx7S1dntIEguWSAQ5LuQu9enDx6KguOINrEBmS0e
         L8JA5Cyo1sq1Zv5OE7itPhdIyYyCLY2Tecx0XOnNbGW3Ir20/Y58rQQlm1ZZztTCCi4H
         016Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=AQc/lAxIOb6k74fw8CYoegjtiESGvIWwV8ZApEq1EkY=;
        b=q7cmOQRnz2G54kFVdbhdUvRRJ1nhotP+JVpnCE/4eCYG3Atp97YsZW0h8dJkRhXeeL
         uFRbZ8P2f17UDlbV5F5HKEe/anhWPZG3u3cd4HFGPHvNl/OpkLAeW0XGnSbMQH0GnHUg
         AzUrixXXBUzqC7kYnDpLRWL9UfD3Nz7l6wGT8or5TiRJ9Ln1kQZkNo1YZmu7D9mR/gEO
         0g1jyz+cyHJpUHKnjaAh0TaK/np+uNg0dgFC5BWbdZ3KbaRi1n4YvaqEKBe9qQd0TT7s
         0R7NhZVAsCcHIk8MdIdVpil96t1HciHASD3HY7luH+nHMH04WJcOH7muaMA3FARIk7XQ
         r/kQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z18si590183lfh.1.2019.06.23.09.32.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 09:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5NGWZ6V027790
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Jun 2019 18:32:35 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.4.55])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5NGWYGZ020510;
	Sun, 23 Jun 2019 18:32:34 +0200
Date: Sun, 23 Jun 2019 18:32:32 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Adam Przybylski <adamprz@gmx.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
Message-ID: <20190623183232.084b6744@md1za8fc.ad001.siemens.net>
In-Reply-To: <bc4047f6-c6c7-4b74-9084-51212c8bd4ad@googlegroups.com>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
	<ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
	<b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
	<20190621155406.18df2751@md1za8fc.ad001.siemens.net>
	<bc4047f6-c6c7-4b74-9084-51212c8bd4ad@googlegroups.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Fri, 21 Jun 2019 07:18:14 -0700
schrieb Adam Przybylski <adamprz@gmx.de>:

> Am Freitag, 21. Juni 2019 15:54:15 UTC+2 schrieb Henning Schild:
> > Am Fri, 21 Jun 2019 14:51:30 +0200
> > schrieb Ralf Ramsauer:
> >   
> > > Hi,
> > > 
> > > On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:  
> > > > Hi Adam,
> > > > 
> > > > On 21.06.2019 17:16, Adam Przybylski wrote:    
> > > >> Dear Jailhouse Community,
> > > >>
> > > >> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
> > > >> Processor. Unfortunately the system hangs after I execute
> > > >> "jailhouse enable sysconfig.cell".
> > > >>
> > > >> Do you have any hint how to debug and instrument this issue?
> > > >>
> > > >> Any kind of help is appreciated.
> > > >>
> > > >> Attached you can find the jailhouse logs, processor info, and
> > > >> sysconfig.c.
> > > >>
> > > >> Looking forward to hear from you.    
> > > > I'd say the following line is the culprit:
> > > >     
> > > >> FATAL: Invalid PIO read, port: 814 size: 1    
> > > 
> > > Could you please attach /proc/ioports? This will tell us the
> > > secret behind Port 814.  
> > 
> > Not always, the driver doing that has to be so friendly to register
> > the region.
> >   
> > > > 
> > > > As a quick fix, you may grant your root cell access to all I/O
> > > > ports and see if it helps.    
> > > 
> > > Allowing access will suppress the symptoms, yet we should
> > > investigate its cause. Depending on the semantics of Port 819, to
> > > allow access might have unintended side effects.
> > > 
> > > You could also try to disassemble your kernel (objdump -d
> > > vmlinux) and check what function hides behind the instruction
> > > pointer at the moment of the crash 0xffffffffa4ac3114.  
> > 
> > A look in the System.map can also answer that question. On a distro
> > that will be ready to read somewhere in /boot/.
> > 
> > Henning
> >   
> > >   Ralf
> > >   
> > > > 
> > > > Best,
> > > > Valentine
> > > >     
> > > >>
> > > >> Kind regards,
> > > >> Adam Przybylski
> > > >>    
> > > >     
> > >  
> 
> Hi,
> 
> I looked up the function which gets executed in the Kernel. It's
> "acpi_idle_do_entry".

Well now you are back to what Valentine said. Open up those ports one
by one, until the problem goes away. The alternative is to disable the
drivers in the root-linux. In the case of ACPI i.e. acpi=off as kernel
parameter, but you probably do not want that.

Note that whatever you allow might cause weaker isolation, in this case
maybe real-time related.

Henning

> Adam
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190623183232.084b6744%40md1za8fc.ad001.siemens.net.
For more options, visit https://groups.google.com/d/optout.
