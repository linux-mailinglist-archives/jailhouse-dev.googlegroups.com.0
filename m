Return-Path: <jailhouse-dev+bncBCI7LDNNRUPBBHE22H3AKGQECNSDACI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc39.google.com (mail-oo1-xc39.google.com [IPv6:2607:f8b0:4864:20::c39])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF561E9B01
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jun 2020 02:34:37 +0200 (CEST)
Received: by mail-oo1-xc39.google.com with SMTP id o9sf3602133oos.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 31 May 2020 17:34:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590971676; cv=pass;
        d=google.com; s=arc-20160816;
        b=uODOFfbMwtEnAYbrpmU+Eg/YuX3M45ONMmDvJdXAIeMFLNYh0SuZrNVsuj0lSakJe6
         h8A44rwOtQlzCoOUN/xVK13VZNxrnT7NDAA6iredFjEQUNG8qcPM2bRhyjvhsicR7v7Q
         PsaEF2UpSzCvvzU/EqR7UWOVOq7nW7N7MrrXO3KehSBmE9fS7+zcmkXr1xuEoSKzG2UP
         vuBeH85t6PDOnsQyD7wihRNPUElc1/Xuw0EvdZgdV8tBv2V+jwpf5UIKT4d+wKkMRnNe
         knuKKZJEO5u4seTU4WZoejEZp+9qwiV8LLzD99UUBzsx0JohYyNL4N0ZRY0hvcOW/AFA
         skJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=dFP3w+/ypEMggVJ6KbeIXiKQdPc3x6onbkCRlkuBcN8=;
        b=OF6Wsj3meJ1WPEILoATgYEx4I0ERbpj7ADAnpwTbM8252gN+DAWDGkhtWBaMTjOnIN
         gpuugLT+oGEDICdzEYuSo3XWhtQZPe+gv0ZsE/DcMixrd916CCZVXEzKtMrdf9czj0xV
         hwJF3Ud9s/EA+ibwEqVp+V2P2KiKBN62EEbbjjNwBBC1AzaLVtHvumkwHEwesom4SoA+
         pGxktH06UUteVotGKhLwlQrrj/mqN9S+/8Vuj9fHQEuhnKUxnYDjO+QQzaQ1CnSN68wX
         LFiYD9e/QsvdO3ePGN57JU8s8OWZGqR7SmhsWFSQbmJkbM9QaXSuKqiS/0Euf7XfnlC5
         v+TQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=S52nluh+;
       spf=pass (google.com: domain of neswgood@gmail.com designates 2607:f8b0:4864:20::344 as permitted sender) smtp.mailfrom=neswgood@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dFP3w+/ypEMggVJ6KbeIXiKQdPc3x6onbkCRlkuBcN8=;
        b=ZDirWi/e8x8G1+TBGu2GNQ+dwvckuRs81HD+0b7H1G3IDA8dpa3pHv1NmfmyoMB0zw
         gjNCISJQevfWcgyBWZC9pSaXUuwkL66olSxMd52COj7htDP0t2P9KrpRedrwhyqmkYAI
         86sgMLiTI7iJjjdjA4i9nGH41NF5gmUkT5WCUW2i/+g9i8RL18yfcceOptpzZiSWFgdN
         HZWwcL/uAiUv/YOOYKDSRpgVWvvA7la+eRtPw0HW5qfLvznuGHwFbPHl8gAa48ifWm8H
         abOYD/IRwBfo79JjvZMkA9sBUt99TCqXH0TvK6bjjcLzZOetxmaJbkoyjH5IMjAe014W
         DLuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dFP3w+/ypEMggVJ6KbeIXiKQdPc3x6onbkCRlkuBcN8=;
        b=FH+0nQbNfaep0KxQnOsAd8ISnKc7ybAZtUHy8hBlpNxPMDvA0y01TLhAFrXKi0J/Jw
         wrfPJzDdmuiyfFEbYEQ09oOWkGFEpANgOt1X6cTB7U0Zn8CY65TW8RyvzHMw62V9vwen
         nG3dMJLzjq6/bpxAlFm4ZZbE4OwfLxTZ62H9r1kxecRiOpyMs3Czdynv92HpeoMwNKL4
         IE45ew6nVPFbIA0/fxXxXgE2A7iZ4CjFYPH2zICawC19aOHfij6PuOZV6IuYYk06byR6
         WutgPOdQlRI34bWpobeLaStj9vcdsw5fWTUTJfz5f05xlZTx/Ei2rEVMGl9wptij+oVM
         NvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dFP3w+/ypEMggVJ6KbeIXiKQdPc3x6onbkCRlkuBcN8=;
        b=GEbmAhcy8vSbcUFv4ZLonPdxB/S526AOBqhw494uLwZUn+z77xEqH0/s24i70bP9OA
         NFzjEXkOKM1sq4yWuDmos6hljughbA6mhiqdO5IfxkXd3LQsihY2hhbrMfDwTd57jCED
         +o9g2om3X83Ef0a6lcSk9xXvxYLQ6XO91/i8zVWj/HnzmHzSBWR7PQW9QTCxQonIz90P
         D4n/ZnhAr6dG6GJRKaE5YkQ2fwdIw/2NSWR/1KDzw0/OOV3EVjG/GGH/4S3qKeRc7HWv
         qsi5I5uUNhcn7a+oVQKQw9kyfgAkQrtkJXmVFwW6a0Gs/uKySQFZz1jFwXLSveYpA/2b
         2Mrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NRjN1VU/hUH9+tgkuQFsHftcFMRQguWx3YsQ7yEKCgyU/tgES
	jXnfp/7xqsGB7RVRPcoRvIw=
X-Google-Smtp-Source: ABdhPJx/KvmF8/ob/bGTMSFmCjjTfBYgrZMiofHstUsjYUZR4+Riovy5YqrDIxla3xZCtIaAaP0CRg==
X-Received: by 2002:a05:6830:114b:: with SMTP id x11mr15853039otq.54.1590971676227;
        Sun, 31 May 2020 17:34:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:d24f:: with SMTP id e15ls345092oos.1.gmail; Sun, 31 May
 2020 17:34:35 -0700 (PDT)
X-Received: by 2002:a4a:381:: with SMTP id 123mr13224687ooi.85.1590971675818;
        Sun, 31 May 2020 17:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590971675; cv=none;
        d=google.com; s=arc-20160816;
        b=jLe0hCjThibMs2YfG9ombCw8xyq8M0I+gELtBDWEVUbJhAwSevb7K3B4ScKvjMHwbf
         WXZNv5J8KpIJkuGbk3fCA7wgmVYP6JgDNVyXja6RURdM/QMPhDuS4X3uFXD9RtS7gT9l
         9W0ae6G095/IVrd2CEnfMC5sYWSTUc4V9vXbnvaBsS8eLeJxyYszNavSKi4HQWa7dTm2
         VFO9n2ntj35PWaHUpSjntve6afMpt/pxY+i79JuppKtv2IvNSbz7QdJhUC5MOlplEgzq
         ot2JszVzNKErqvdC864Etxj8D9Qof9fQDq8ho8vrYKvUAUdK4csNR0u9i7lTUp1WQGVK
         ZOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QPyFeV2cDELhd9dc6jn+njAi3ogL1W0LM6bYSp1zceI=;
        b=iaZWB2+KIztsIzPlutWyar61scA57DfwZTxWbj11iyKBu/+gw0yBdEgReAaGb8YSZg
         bgE9VydYr798fgLc6pjOGfQy2cVvFTr39V/5cq8rkwMN42hRIOYXCX1rXcW5UZ1QNyDv
         jtr5hqcpT10jScucTg95DzX5rPMwwuSkdbQp1PniLbOM2tSuN3El+SropdrAh6nCY4/G
         yOd0W6n2tXIwpQqqCWDngowvSgkYpsv8ElyX83H7ctsMe005w+f40Aj0kzVfFxjq3cjn
         t/P178a8K2wbq9bkxIBFxnSzBg8ESZ4Sv1OvMOZoYX46Qu7AiQjZysTT0Ogwz+SLIfto
         y1hA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=S52nluh+;
       spf=pass (google.com: domain of neswgood@gmail.com designates 2607:f8b0:4864:20::344 as permitted sender) smtp.mailfrom=neswgood@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com. [2607:f8b0:4864:20::344])
        by gmr-mx.google.com with ESMTPS id e23si1155016oti.4.2020.05.31.17.34.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2020 17:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of neswgood@gmail.com designates 2607:f8b0:4864:20::344 as permitted sender) client-ip=2607:f8b0:4864:20::344;
Received: by mail-ot1-x344.google.com with SMTP id m2so4691687otr.12
        for <jailhouse-dev@googlegroups.com>; Sun, 31 May 2020 17:34:35 -0700 (PDT)
X-Received: by 2002:a9d:32b4:: with SMTP id u49mr14949509otb.304.1590971675594;
 Sun, 31 May 2020 17:34:35 -0700 (PDT)
MIME-Version: 1.0
From: Marvella Kodji <marvellapatrick1@gmail.com>
Date: Mon, 1 Jun 2020 01:34:05 +0100
Message-ID: <CAF0CuhBr_a7+a5kZMGcJALC+o2mbQ6uUse7rgfn3_-Nrefj4xw@mail.gmail.com>
Subject: 
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000092540f05a6faf50d"
X-Original-Sender: marvellapatrick1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=S52nluh+;       spf=pass
 (google.com: domain of neswgood@gmail.com designates 2607:f8b0:4864:20::344
 as permitted sender) smtp.mailfrom=neswgood@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000092540f05a6faf50d
Content-Type: text/plain; charset="UTF-8"

How are you doing

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAF0CuhBr_a7%2Ba5kZMGcJALC%2Bo2mbQ6uUse7rgfn3_-Nrefj4xw%40mail.gmail.com.

--00000000000092540f05a6faf50d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span>How are y=
ou doing</span></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAF0CuhBr_a7%2Ba5kZMGcJALC%2Bo2mbQ6uUse7rgfn3_-Nre=
fj4xw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAF0CuhBr_a7%2Ba5kZMGcJALC%2Bo2mbQ6uUse=
7rgfn3_-Nrefj4xw%40mail.gmail.com</a>.<br />

--00000000000092540f05a6faf50d--
