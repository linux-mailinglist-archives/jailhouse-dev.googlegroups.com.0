Return-Path: <jailhouse-dev+bncBDSLXZPS5ULBBXOZVOKAMGQENQB2HOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id 191CA53078F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 May 2022 04:09:35 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id x9-20020a05620a14a900b006a32ca95a72sf8481165qkj.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 May 2022 19:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iqVf/uZuNtpdupPCMZ6aSBWEC2QAesi09GfyKgYe9m4=;
        b=qHIrZ1EB6lQXv+8m+/AxB5HffGTt6e/r7q7rpB3wrXzzR1cVVxdI40mH/iztXEhpFX
         OiTVSHjnBjtXNT6wRE6lTlAGoOSNpttluBJSqlXNNHYlhOkpysz0zV36FYAAqw6OjInY
         vbfdN1fod1GUbI+SM+99ytstyJIRCaBt9T/YlHA2VnMs+qiWRZq7bTQ2GadK1Q0tfuAM
         FD3D9RoOuTzzoEK8gTIf9blgNrGQcAwv4dQp1gH4FVwqCdzlPniA/QjvdKkSFrNeAq9P
         kmOSW1KvxxPBrO57+Ifa3GnZo/fZFgXTB8u13y+n4OdwQ5+1Y8D3ogLM2U0dpL6WrSOR
         jWYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iqVf/uZuNtpdupPCMZ6aSBWEC2QAesi09GfyKgYe9m4=;
        b=gw6HeITrs/TZdj+WU4WaZaZhV4IA348PdhXnKfOC7tyF5EU3MawQe8r/NOiJI2a3mt
         o5phIDio4HWhymwmjGfKryyExAvJ7dA9TBYP+DJhGf7ysQ4fIGtpgMjK7CGHttHho0Rr
         F7ZLd8g+nOSW75DCUnglXmDvpJHCIcPOzsRwo75V+EmRghXaPITr5PXXMS8rvVrJza/2
         IlyfRqgM0vDT3j/L4yY5zDxapZTwRb/ymWD0W9w0yuesbVrI3OaVO6Dw4n7ZfvH9EZR9
         R3O7Mb1b0ltCNY3qaNH7vJJAwTn2EoY9QDoyZ8htXINUrkjgtQ0VydzGZ1e+5gN0uIK2
         PgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iqVf/uZuNtpdupPCMZ6aSBWEC2QAesi09GfyKgYe9m4=;
        b=3SkU2S/PBd0qd/0ktytHuxrAVSWMmC3odSanbFOkU5DzOrZI6CjRPlYoZC4M0YricM
         +Mr0yJl8xsCXaySNESP6U1kbzSjIkcgNHZY05DTvZ+XvP4aD2YGGJk0Y/UvaNIqNnFmP
         OYV2dH6ffQ0eWQeklxwqbFsYJVaKCF+QvxMYHwRe+dgKJb1Vg1jUcu4TG16mITwbu4Ov
         7v0j+r1+cDyYt+otiOHLFOhBCBno64HJEozRmONXCw8s4xxMl+EJEAkHpr4q5Lg5rE43
         2ATkqiMBbSqD7CGVI8LRTNVCHotgpkzte+TTcFDL1WalVUcPY7uZz7ZVeTOsugcM635t
         cHow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533nqcQtQiESqnbBofO/x3K9uFT+F/4dTOZybIxz00gPSfh0x+EY
	ew/0GNQsuqlUcrLAxCEfafg=
X-Google-Smtp-Source: ABdhPJxWabtVBiFPpd4cc+B4xeZlvIdc7oZknW2gm+Qk1pOtNZzjhyhdT4Q1/ZSMvzCHUy6omF08VA==
X-Received: by 2002:a05:620a:4488:b0:6a3:7370:65a8 with SMTP id x8-20020a05620a448800b006a3737065a8mr3959790qkp.505.1653271773995;
        Sun, 22 May 2022 19:09:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:690d:0:b0:2f3:c611:5ca1 with SMTP id bt13-20020ac8690d000000b002f3c6115ca1ls5866964qtb.4.gmail;
 Sun, 22 May 2022 19:09:33 -0700 (PDT)
X-Received: by 2002:a05:622a:592:b0:2f9:29ff:daf5 with SMTP id c18-20020a05622a059200b002f929ffdaf5mr7346696qtb.601.1653271772966;
        Sun, 22 May 2022 19:09:32 -0700 (PDT)
Date: Sun, 22 May 2022 19:09:32 -0700 (PDT)
From: manliang tang <manliang.tang@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a2f75d1a-f1da-42ee-84b8-fb244106448fn@googlegroups.com>
In-Reply-To: <3c1ce5d2-fb60-a7eb-82df-5466e1320f92@siemens.com>
References: <a46c03b4-9f14-4240-ad4f-0dad3a335f47n@googlegroups.com>
 <3c1ce5d2-fb60-a7eb-82df-5466e1320f92@siemens.com>
Subject: Re: Kernel crash after exiting from enter_hypervisor
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4036_715915285.1653271772233"
X-Original-Sender: manliang.tang@gmail.com
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

------=_Part_4036_715915285.1653271772233
Content-Type: multipart/alternative; 
	boundary="----=_Part_4037_865016844.1653271772233"

------=_Part_4037_865016844.1653271772233
Content-Type: text/plain; charset="UTF-8"

The root cause is missed some memory region in the configuration file. I 
added these regions, the crash went away.

On Wednesday, April 27, 2022 at 2:24:19 PM UTC+8 j.kiszka...@gmail.com 
wrote:

> On 13.04.22 13:44, manliang tang wrote:
> > Based on Kernel 4.19, I tried to run Jailhouse on real ARM board. I
> > build the driver/firmware/tool/configuration file successfully, copy all
> > these files to ARM board, then set the bootargs(mem=) and inert the
> > driver module. I saw the Kernel crash when run the "jailhouse enable"
> > command.
> > 1. command
> > /data # insmod jailhouse.ko
> > /data # cp jailhouse.bin /lib/firmware/
> > /data # ./jailhouse enable aml-c2.cell
> > 
> > 2. Attached is the detailed log
> > 
>
> The crash does not directly point to Jailhouse on first sight. Seems
> like some callback in ipv6_dev_get_saddr() is pointing to NULL, and the
> kernel tries to invoke it. Or do you have CONFIG_CRASH_CELL_ON_PANIC
> defined? I'm missing the output of Jailhouse itself. If it detects a
> violation and injects such a crash, that may explain the NULL as well.
>
> Jan
>
> -- 
> Siemens AG, Technology
> Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a2f75d1a-f1da-42ee-84b8-fb244106448fn%40googlegroups.com.

------=_Part_4037_865016844.1653271772233
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The root cause is missed some memory region in the configuration file. I ad=
ded these regions, the crash went away.<br><br><div class=3D"gmail_quote"><=
div dir=3D"auto" class=3D"gmail_attr">On Wednesday, April 27, 2022 at 2:24:=
19 PM UTC+8 j.kiszka...@gmail.com wrote:<br/></div><blockquote class=3D"gma=
il_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204=
, 204); padding-left: 1ex;">On 13.04.22 13:44, manliang tang wrote:
<br>&gt; Based on Kernel 4.19, I tried to run Jailhouse on real ARM board. =
I
<br>&gt; build the driver/firmware/tool/configuration file successfully, co=
py all
<br>&gt; these files to ARM board, then set the bootargs(mem=3D) and inert =
the
<br>&gt; driver module. I saw the Kernel crash when run the &quot;jailhouse=
 enable&quot;
<br>&gt; command.
<br>&gt; 1. command
<br>&gt; /data # insmod jailhouse.ko
<br>&gt; /data # cp jailhouse.bin /lib/firmware/
<br>&gt; /data # ./jailhouse enable aml-c2.cell
<br>&gt;=20
<br>&gt; 2. Attached is the detailed log
<br>&gt;=20
<br>
<br>The crash does not directly point to Jailhouse on first sight. Seems
<br>like some callback in ipv6_dev_get_saddr() is pointing to NULL, and the
<br>kernel tries to invoke it. Or do you have CONFIG_CRASH_CELL_ON_PANIC
<br>defined? I&#39;m missing the output of Jailhouse itself. If it detects =
a
<br>violation and injects such a crash, that may explain the NULL as well.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Technology
<br>Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a2f75d1a-f1da-42ee-84b8-fb244106448fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a2f75d1a-f1da-42ee-84b8-fb244106448fn%40googlegroups.co=
m</a>.<br />

------=_Part_4037_865016844.1653271772233--

------=_Part_4036_715915285.1653271772233--
