Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBGPA2COQMGQE5E7AAQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1138.google.com (mail-yw1-x1138.google.com [IPv6:2607:f8b0:4864:20::1138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1278265C0F9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Jan 2023 14:39:39 +0100 (CET)
Received: by mail-yw1-x1138.google.com with SMTP id 00721157ae682-45dd4fb5580sf318323807b3.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Jan 2023 05:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckhmsQT/tJCNPr6zpBsiKnd8JE2ilNYQHiw9Wz/KGLY=;
        b=W7dsvLU56I66gqLlRn0znNOwH2b+ADGtWZNS8zKP0DgE3cGXLwA71x5rf3og7uDmSH
         7r/kz/ZUSPp+uRwi13I5ViiyKC1sshlfV26v+7JF129nMazCbV2MC5P0N8nRtWv7XM9R
         JhsaDZcpSBfrkd7ivFkmvez7iFptRbJ9SXBSSYEXx2pBrQycF/J/qtlzoMfl9Aqtljrl
         kca2LB2DuDaEUtakAEMVP2FhMMxVWDnbcUO0/GpR0MJfztxUkbi77RTfV7XKkZM8eiBu
         QgFkdBH+57UOX/oHz/XPor+f6+4gqgNMqiKZhXGHzTBIk6mNU3bcHoRcIC8QofyGH3So
         KnTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckhmsQT/tJCNPr6zpBsiKnd8JE2ilNYQHiw9Wz/KGLY=;
        b=e8O3lhrfe4IyUJxLzHll1kN+OnbvPONhyAthmd5deWxErRGnBp8+WuLvZfvmWWMU5v
         nC9t3vE31sP9PZeg8ITIbgetqteeWi+fZrkokZZwGol91u+zAGZXRps2U08bI9WF1lz5
         rwvSXP80YRIFsQXk3KhqytuVT5RDiBNyi4dFKpB9lww6CyIloAb5fDnufEzdKyDtosoI
         7/Et9LHQLl6dc8w9+irP59R4P6jLM4hMTa30COoe0DqBhNGZABAiTonGGa5sp3hf039O
         WpRSudHiT1d/UvfRXMeGq/i4abh1W5iu+VKLR1auoUbDgGau/JmRYi708MulhWgqCnNB
         A62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckhmsQT/tJCNPr6zpBsiKnd8JE2ilNYQHiw9Wz/KGLY=;
        b=BORgsIzHwoE1yKJOcFHJjXPnpcoJiuSTPoIpRMcRIMxvl0F6ts/Z1IEbyFZglY/Nxj
         eAAaq28p+uSTJ40QA7sgT1JD5Ym29l44nJ1w1hpVvhVWulAkql90v2UKXvqKE+t/8AGP
         oTHlGsbM2LrNQAuZ3bR4wfZeqvjuvauEWXQlNZUVfSl279zCn7NKnoBBxSmu6ekX52ca
         YaU4cAFMz9Q+TadjwpMMsSqC4BBUgXfNXUrg5GdzNxIq+E8iWcRoiI5wdjU1cpMNWqYd
         mipCtTbaqJuG666+B9egRHs84XIQ/G307isFYHd1IMvscEQjia0VKjEPUcbCPBo9W1xt
         GHbw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpp2TUoepyTrxbL23MKkU1sKjxzzyKxL2YWivxch3+GJddXn3w3
	4S6O7DhsqbR5Y+oIDf15DM8=
X-Google-Smtp-Source: AMrXdXtGb6X34mOGmk1VrDy/obTfgEnZLbIFCnB6Elm8kuwGlWJm/4Bmy7qTAgGg1v9s8j1D3Fn1vQ==
X-Received: by 2002:a05:6902:b06:b0:745:aced:ec3d with SMTP id ch6-20020a0569020b0600b00745acedec3dmr4633798ybb.599.1672753177777;
        Tue, 03 Jan 2023 05:39:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:adc4:0:b0:703:f07:5c7c with SMTP id d4-20020a25adc4000000b007030f075c7cls15575965ybe.9.-pod-prod-gmail;
 Tue, 03 Jan 2023 05:39:36 -0800 (PST)
X-Received: by 2002:a25:7752:0:b0:741:7d19:89e4 with SMTP id s79-20020a257752000000b007417d1989e4mr5002574ybc.638.1672753176606;
        Tue, 03 Jan 2023 05:39:36 -0800 (PST)
Date: Tue, 3 Jan 2023 05:39:35 -0800 (PST)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9dd4fcde-efe8-41f1-9c71-b50e6d3c0dafn@googlegroups.com>
Subject: Sensitivity of hypervisor configurations to HW changes (x86 target)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_26480_412744137.1672753175994"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_26480_412744137.1672753175994
Content-Type: multipart/alternative; 
	boundary="----=_Part_26481_927490337.1672753175994"

------=_Part_26481_927490337.1672753175994
Content-Type: text/plain; charset="UTF-8"

For the productive use of the hypervisor "Jailhouse" I am concerned about 
another topic: "Sensitivity of the hypervisor configurations to HW changes".
 
I have already created the hypervisor configurations for 8 different x86 HW 
targets (evaluation boards, industrial PC's, single board computers, ...) 
for the root cell and for up to 2 guest cells.
 
I also "cloned" some HW targets; however, I was scrupulously careful that 
the HW (RAM, PCI devices, BIOS version, ...) was identical.
 
To duplicate an x86 HW target, in my experience, the following components 
must remain the same so that the hypervisor configurations already created 
can still be used:

1. CPU model and architecture
2. RAM memory size
3. PCI devices (including M.2 NVME SSD!)
4. BIOS version
 
For mass production based on a Single Board Computer (SBC) some points can 
easily be kept (e.g. CPU model and architecture, PCI devices (except M.2 
NVME SSD), BIOS version).
 
On the other hand, you can't guarantee that you can always use the same 
type for the M.2 NVME SSD, for example.
However, the change of the type of the M.2 NVME SSD, which is actually 
imperceptible for the user, will possibly be noticeable in the hypervisor 
configuration (e.g. different PCI capabilities).
 
Another problem is the deviations that creep into memory and I/O layouts. 

Are there any experiences and practical solutions regarding this topic?
I would appreciate any advice on this!

Jan-Marc.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9dd4fcde-efe8-41f1-9c71-b50e6d3c0dafn%40googlegroups.com.

------=_Part_26481_927490337.1672753175994
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the productive use of the hypervisor "Jailhouse" I am concerned about a=
nother topic: "Sensitivity of the hypervisor configurations to HW changes".=
<br>&nbsp;<br>I have already created the hypervisor configurations for 8 di=
fferent x86 HW targets (evaluation boards, industrial PC's, single board co=
mputers, ...) for the root cell and for up to 2 guest cells.<br>&nbsp;<br>I=
 also "cloned" some HW targets; however, I was scrupulously careful that th=
e HW (RAM, PCI devices, BIOS version, ...) was identical.<br>&nbsp;<br>To d=
uplicate an x86 HW target, in my experience, the following components must =
remain the same so that the hypervisor configurations already created can s=
till be used:<br><div><br></div><div>1. CPU model and architecture</div>2. =
RAM memory size<br>3. PCI devices (including M.2 NVME SSD!)<br>4. BIOS vers=
ion<br>&nbsp;<br>For mass production based on a Single Board Computer (SBC)=
 some points can easily be kept (e.g. CPU model and architecture, PCI devic=
es (except M.2 NVME SSD), BIOS version).<br>&nbsp;<br>On the other hand, yo=
u can't guarantee that you can always use the same type for the M.2 NVME SS=
D, for example.<br>However, the change of the type of the M.2 NVME SSD, whi=
ch is actually imperceptible for the user, will possibly be noticeable in t=
he hypervisor configuration (e.g. different PCI capabilities).<br><div>&nbs=
p;</div><div>Another problem is the deviations that creep into memory and I=
/O layouts. <br></div><div><br></div><div><span style=3D"background-color: =
yellow;">Are there any experiences and practical solutions regarding this t=
opic?</span></div><div><span style=3D"background-color: yellow;">I would ap=
preciate any advice on this!</span></div><div><br></div><div>Jan-Marc.<br><=
/div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9dd4fcde-efe8-41f1-9c71-b50e6d3c0dafn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9dd4fcde-efe8-41f1-9c71-b50e6d3c0dafn%40googlegroups.co=
m</a>.<br />

------=_Part_26481_927490337.1672753175994--

------=_Part_26480_412744137.1672753175994--
