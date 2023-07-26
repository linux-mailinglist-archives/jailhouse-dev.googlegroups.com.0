Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBB2HXQOTAMGQEGZMBZYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38976345C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 12:56:41 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-c64ef5bde93sf7197117276.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1690369000; x=1690973800;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rtKIUvnWACmcrA0IiW2/3DxJRvq/L5Pg+RbdDS33Ko=;
        b=X8Komglkqy75k8oFC6HL2pugM7BD6Ga606HSCqocinjk2Sq3ncNlyZKZJA2K2WBbAE
         GlhJTbISQTnPB4Ba6/Il9H0pcUg0V0HFQ8SJWPud1DOnykRk3OSdkw+FdG23gcsuUYfM
         i6h/s5lW4TO9cAXYR7vk0jsgdatJPbufKENgwSyRdm5soG/yYW/rXu81MILt+taSvIh9
         s7VctRznzl73MjVsWuOADX5BnyE720bz+L9hmBI/z3HqMwYKWrZ4D6jjGeKOv8slaRjI
         Qt0/5G6vfMn/W8vqJ8QHk3HIVIR4dFOdPCM8+VFOk8MpzwpIY2B8xO8Ul2+Nr2DdsQ98
         eU1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690369000; x=1690973800;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rtKIUvnWACmcrA0IiW2/3DxJRvq/L5Pg+RbdDS33Ko=;
        b=gcNkded9/4u0/VVZUcoLhPx7sF+sn3OFsNlkhr6ayqJNR4aH13EWACb0Un+bMDv/Fz
         KHiV85cEPULOPCrysMCTxvzy+04SjnB1HROdtW03gW52KUTGJwxNy/909BcFzLjoK6Ko
         1videR0Q88SXd3DfuB9gmqLA/NFQrNeiv+3t73p51RbS3bSsVnPM6FDELtUV4m4SjCPD
         bu0TQqGTUq6lC1dS6sUHEx2mxldKZ/LqQSb7CsfPMJwennvB5lvLJPXavRdLZfzLCN0V
         Xa34hVqdo/NAARrMv+U91ieh64pzyU0fr+vKqJ0DxQatzXMIv78cS0TawcaPqBlYv6hB
         nPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690369000; x=1690973800;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rtKIUvnWACmcrA0IiW2/3DxJRvq/L5Pg+RbdDS33Ko=;
        b=SKHmsen1wHCvFqywhVmt/mNGNdRJq8wDSL5wrKxRGOWOBTP7nq+T6vAPZsfuKuG3CA
         UHDAfm39nwjWqR98IL3nxbM7pTSo7m24ij9/28BqMx118+pl5ztvY4tbKv7p8NnBWC0K
         A1SVdc1uADQFKVmLxEyOSJqRf3pH3r2BDjaVRn23+mQPHP932JId2MYYkS6MC7Xo94Pb
         6eBpHbEojfiQU7fphZNlNFPCWhIcp2OhOlEKf2nvt45VOqWQExPFgaNMBFB8NK+0Ybkd
         0YkSFG0qQTomDRi058F589/xfymfrrDPVhvpLnIVIOYcqoH/2jD/kDyamuoKLn6O0C2h
         Asyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLav3LqchBnZJjtT8zuykuZmFeT3E6YmqvQSsDfUcxhuIib+T6HL
	D95CfEYgnYOIplNeIRJbmSg=
X-Google-Smtp-Source: APBJJlFBlWsC9exbtXIxYtxkowGb8qWKLC3a1sgRTwbvkA20yWdN+OxSzqxgcsyCSfe+XkiuMRE+OQ==
X-Received: by 2002:a25:69c5:0:b0:d09:d04b:935d with SMTP id e188-20020a2569c5000000b00d09d04b935dmr1400793ybc.14.1690369000579;
        Wed, 26 Jul 2023 03:56:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:100b:b0:bfc:565b:9306 with SMTP id
 w11-20020a056902100b00b00bfc565b9306ls2515999ybt.2.-pod-prod-06-us; Wed, 26
 Jul 2023 03:56:39 -0700 (PDT)
X-Received: by 2002:a25:abd2:0:b0:d05:e080:63c6 with SMTP id v76-20020a25abd2000000b00d05e08063c6mr11174ybi.9.1690368999425;
        Wed, 26 Jul 2023 03:56:39 -0700 (PDT)
Date: Wed, 26 Jul 2023 03:56:38 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <43f41f9d-0930-416b-a618-1955e237cc87n@googlegroups.com>
In-Reply-To: <faf9ae5c-7f62-5814-7453-793bffb881c3@oth-regensburg.de>
References: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
 <faf9ae5c-7f62-5814-7453-793bffb881c3@oth-regensburg.de>
Subject: Re: Configuration with 2 guest cells
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2036_311588555.1690368998755"
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

------=_Part_2036_311588555.1690368998755
Content-Type: multipart/alternative; 
	boundary="----=_Part_2037_1928346924.1690368998755"

------=_Part_2037_1928346924.1690368998755
Content-Type: text/plain; charset="UTF-8"

Of course, I checked the configuration for the root cell with "jailhouse 
config check".
However, this is not changed at all while I change the configuration for 
the guest cells.

Also, everything is fine as long as I don't set the size for the guest cell 
larger than 320 MiB in the guest cell configuration.
This only uses about 62% of the memory area reserved for the guest cells in 
the configuration for the root cell.

I will follow up on the tip to increase the memory area for the hypervisor 
( hypervisor_memory.size).
So far, 6 MiB is reserved for the hypervisor itself.
To what size should I increase this memory area?

However, to find the cause in the driver or hypervisor, I lack the 
necessary knowledge about the structure and relationships.
So I have to rely on external help.

Thanks a lot!
Jan-Marc.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com.

------=_Part_2037_1928346924.1690368998755
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Of course, I checked the configuration for the root cell with "jailhouse co=
nfig check".<br />However, this is not changed at all while I change the co=
nfiguration for the guest cells.<br /><br />Also, everything is fine as lon=
g as I don't set the size for the guest cell larger than 320 MiB in the gue=
st cell configuration.<br />This only uses about 62% of the memory area res=
erved for the guest cells in the configuration for the root cell.<br /><br =
/>I will follow up on the tip to increase the memory area for the hyperviso=
r ( hypervisor_memory.size).<br />So far, 6 MiB is reserved for the hypervi=
sor itself.<br />To what size should I increase this memory area?<br /><br =
/>However, to find the cause in the driver or hypervisor, I lack the necess=
ary knowledge about the structure and relationships.<br />So I have to rely=
 on external help.<br /><br />Thanks a lot!<br />Jan-Marc.<br /><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.co=
m</a>.<br />

------=_Part_2037_1928346924.1690368998755--

------=_Part_2036_311588555.1690368998755--
