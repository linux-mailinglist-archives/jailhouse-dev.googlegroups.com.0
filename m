Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBAGD7T5AKGQEY4TMNVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 79082268690
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Sep 2020 09:53:37 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id f5sf11307957qtk.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Sep 2020 00:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F1h4Bh5Zl4TQT6PA7kLYQI3uh47Yi1jUsFg/mdfwHUw=;
        b=p5QxsQhZg5EfRVczU9W2zFT4BHza6V08m5gWuoNMlaxIp/wECyVAF6vwqP0QoDEuZV
         3tKdYJE6lEmv187L/TMrGgskYWPj4rUab52vlKKjgmo2x4UVx+Vr04CQIH6q/uwzZyVa
         ANK2PPr61uOev1hRMc/qjUmxTYJVE0UKQgCdSn3yUNJD1J2tJdwuNY4aGWv6fnz0Lbxm
         JRbYZvzU+tVCBNRhgv9MVOU6ds777/5bW8S6CLa162zndv6C0C12/xOZnxUx2t/YUtbe
         Ro0EP+H5V7WxhxfIRHZIRw5ezXvH+wRxvhWkPGVb59dlgUHo9cBHHDhUuxsF4ePdTn5h
         Sixg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F1h4Bh5Zl4TQT6PA7kLYQI3uh47Yi1jUsFg/mdfwHUw=;
        b=OdA867eIv8sMQLhSuYm3po5PKODQI6xadCuqPPOlgKa5cGnka7/XoCT5mvKKiM4aoY
         kN0Zy/num5TJIeubxstaZt4JpsYBe2bmEcRkv/dYHQFLUSLcACpMEsr8e95K8I/wDNCF
         rQFo6WbjCfckPW9CZcxIlyhPBpSuC8ron7XOd2zCbazUCMlAOb8zHNGqyJCsHwFDFhsS
         +xoiEENEA03tCqmBun3v+IOam7fVRUuRnoWlASPMDJYzN4F9a/2VrMLTnulbDo3BaDWN
         vNfl6Qh0uXEEpjZme7DHFgUt3FlQbhsUUp4GfEXPY7thE40NJtBYvyx8RPg6xzSBhn0U
         IWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=F1h4Bh5Zl4TQT6PA7kLYQI3uh47Yi1jUsFg/mdfwHUw=;
        b=IU1EYUB5tfoDVVwIua3Pf1vrsBDGJPma5Xkxk24iQhnQOb9osStX5vHJm+dBkszeEw
         9f6ucqMk/dKLdl3/8qeXBezLf+sswD0EZHptaZcIyKx2Ix6rW+cbAY0fOZiCqBON9FdE
         L9Fu00pEf6+40wu5Z3RC3NDTaV+ijmlPp/p44HBkBaGFgqudKu+EpmwTs1bLhvYUJUOO
         sb3t1eVQ8UJdr+gg26wI/pqwKFjnppqU48AfAYNcPQ8rxQGsVZhFCiFcgze5hi0uYHxk
         de0zicPu3Yk8NZmBUkVW8e1mI6Pp2GgcgeBL+0o/YT8dktYEQDwuPiqKfuoSmrvGGy1y
         oNNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533JlmZvHsSlv4xSssiLLQD21NerUQgBkz3bazAPeIuVMOnTx1ki
	dhqJfiRqE5ruiZX5ttEVd/4=
X-Google-Smtp-Source: ABdhPJwWj/QUqzACC5rPgkwnhgL3bwRPgxq0DySLMqKIx0xk7nHaRmqEOgAnwQ0ypajsurkGv81X3Q==
X-Received: by 2002:a37:8404:: with SMTP id g4mr428665qkd.63.1600070016337;
        Mon, 14 Sep 2020 00:53:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aed:21a8:: with SMTP id l37ls3570097qtc.7.gmail; Mon, 14 Sep
 2020 00:53:35 -0700 (PDT)
X-Received: by 2002:ac8:4e55:: with SMTP id e21mr12706206qtw.66.1600070015630;
        Mon, 14 Sep 2020 00:53:35 -0700 (PDT)
Date: Mon, 14 Sep 2020 00:53:34 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <db9ebca7-2cf5-4b6e-baf5-d7413eb39c2bn@googlegroups.com>
In-Reply-To: <f0ec3dc1-ed2d-4c48-8a6b-14c16f1b0674n@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
 <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
 <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
 <8fc62bd6-478d-9725-ca0b-949f6e9217db@siemens.com>
 <ed7b0bc6-953a-4449-b77e-3d8b2db84e94n@googlegroups.com>
 <313b5c57-f64d-17dd-28ab-39af5b9058cb@siemens.com>
 <3752cf4d-64e6-4e55-b40d-08800a689f0an@googlegroups.com>
 <c9c32f69-572f-8224-8a10-e0922d7374bc@siemens.com>
 <ec528e54-0acc-494c-95f7-314d6388d4aan@googlegroups.com>
 <f0ec3dc1-ed2d-4c48-8a6b-14c16f1b0674n@googlegroups.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1648_578676677.1600070014986"
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

------=_Part_1648_578676677.1600070014986
Content-Type: multipart/alternative; 
	boundary="----=_Part_1649_873570783.1600070014986"

------=_Part_1649_873570783.1600070014986
Content-Type: text/plain; charset="UTF-8"

As a supplement to my previous entry:

The UART is a "Synopsys DesingWare APB UART".

The command "dmesg | grep ttyS" returns 
dw-apb-uart.0: ttyS0 at MMIO 0x9131E00 ... is a 16550A

In the configuration for the Linux Kernel the option 
"CONFIG_SERIAL_8250_DW" is set.


Jan-Marc Stranz schrieb am Montag, 14. September 2020 um 09:32:12 UTC+2:

> Hi Jan!
>
> I've tried everything possible regarding the output on the serial port 
> (/dev/ttyS0), but I still don't get any messages when I run the command 
> "jailhouse enable ...".
>
> In the configuration for the root cell I tried both 
> "JAILHOUSE_CON_REGDIST_4" and "JAILHOUSE_CON_REGDIST_1", both without 
> success.
>
> After starting Linux the serial port "/dev/ttyS0" is set to a baudrate of 
> 9600 and "8N1".
> Without changing these settings I test this serial port with the command 
> "echo "Test" > /dev/ttyS0". On the connected Linux PC I get the expected 
> text .
>
> But now I cannot find out the reason why the system freezes when I execute 
> the command "jailhouse enable ...".
>
> What else can I do?
> I have attached the configuration file for the root cell.
>
> Best regards
> Jan.
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/db9ebca7-2cf5-4b6e-baf5-d7413eb39c2bn%40googlegroups.com.

------=_Part_1649_873570783.1600070014986
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As a supplement to my previous entry:<br><br><div>The UART is a "Synopsys D=
esingWare APB UART".</div><div><br></div>The command "dmesg | grep ttyS" re=
turns <br><span style=3D"font-family: Courier New;">dw-apb-uart.0: ttyS0 at=
 MMIO 0x9131E00 ... is a 16550A</span><br><br>In the configuration for the =
Linux Kernel the option "CONFIG_SERIAL_8250_DW" is set.<br><br><br><div cla=
ss=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Jan-Marc Stranz s=
chrieb am Montag, 14. September 2020 um 09:32:12 UTC+2:<br/></div><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px sol=
id rgb(204, 204, 204); padding-left: 1ex;"><div>Hi Jan!</div><div><br></div=
><div>I&#39;ve tried everything possible regarding the output on the serial=
 port (/dev/ttyS0), but I still don&#39;t get any messages when I run the c=
ommand &quot;jailhouse enable ...&quot;.<br><br>In the configuration for th=
e root cell I tried both &quot;JAILHOUSE_CON_REGDIST_4&quot; and &quot;JAIL=
HOUSE_CON_REGDIST_1&quot;, both without success.<br><br>After starting Linu=
x the serial port &quot;/dev/ttyS0&quot; is set to a baudrate of 9600 and &=
quot;8N1&quot;.<br>Without changing these settings I test this serial port =
with the command &quot;echo &quot;Test&quot; &gt; /dev/ttyS0&quot;. On the =
connected Linux PC I get the expected text .<br><br>But now I cannot find o=
ut the reason why the system freezes when I execute the command &quot;jailh=
ouse enable ...&quot;.<br><br>What else can I do?<br>I have attached the co=
nfiguration file for the root cell.</div><div><br></div><div>Best regards</=
div><div>Jan.<br></div><div><br></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/db9ebca7-2cf5-4b6e-baf5-d7413eb39c2bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/db9ebca7-2cf5-4b6e-baf5-d7413eb39c2bn%40googlegroups.co=
m</a>.<br />

------=_Part_1649_873570783.1600070014986--

------=_Part_1648_578676677.1600070014986--
