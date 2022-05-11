Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBUO356JQMGQEUST3PZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113a.google.com (mail-yw1-x113a.google.com [IPv6:2607:f8b0:4864:20::113a])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0FE523B24
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 19:09:39 +0200 (CEST)
Received: by mail-yw1-x113a.google.com with SMTP id 00721157ae682-2f7ee6bc6ddsf23368587b3.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 10:09:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652288978; cv=pass;
        d=google.com; s=arc-20160816;
        b=fGBiwCLWX6y6E7flEoVcWn5iRIp3oneZiXjztT0XOSBd5Fmi7cOq7ybLgnLCDakn4U
         nhphbz4b9tQ4bNwLgl2xe8Xjyu4LSmASBxriB9cKTkVrEAGNzTad9ChFN4AtKTWzWqw9
         CGDG4h2t2/fsYpZ/ITsl+lN7nLuI3w1M9F5tHvx5INqS7WO4eGsK23hb+jHneSxOktv9
         ir6aJf23pGcvixeQhFfH86LY3LFRIl99H5mQyr863bxmO2wk23+UgfAXpDUF9Tqst4nK
         o1Fcsltpr2wwqlnWZCXOTD3sMr8lm+jUkyo2vBTLo4EOTLNG3dhbs0F5JI3/vazD3cK6
         3Mqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=btGq6UFiQ6uZ4khGGxN4VPXYoggYsnaQyHGarwNW8j8=;
        b=ax5EyxCaFpeA3NctnLf5nXj9QzMRNQFfLhi7RA+rwyDqfzCPUNG3krbC4uJJRjuPrp
         mapKfd2acY/BQFRBRJYrWmatI91c9oOR0MpOmxiwoT8jY5CvrvrPxbd4X1s1JzaSRjQU
         1fUeNKJ/rBphDA+u/dnTm73p9stjEHT83IS0iAF8SFrk3s0QInENRhYNuqUX5gCoN14b
         6ZA/mfd05g8cgX65cyk5Yb4fAtBGnxVKFIh9LDWsnLlENCqOYP+DI75M+Uw++iGkK570
         0y/u97V3/S4kH2ebx6FzC+4HS8Dn3yaVAURbhkg53GojyHCgu3sYUixiuyNtoYc0OtdW
         QgUw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FhR7oFMM;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=btGq6UFiQ6uZ4khGGxN4VPXYoggYsnaQyHGarwNW8j8=;
        b=cfJMLrSvRCwBBXIDw0RqUHdQxo5mI/zOVf9/HzSHn3fD+J66NTHWijJlZVeDXut736
         vA46tZH5qagXwORP6ufp6Mwi8rpG5eylktxrFpKcLPYxa52NhHDxMVOPg3BLV1vwMIQ1
         cOyb7eDblXiRAme6WKL+ESItLJZOmLezSvX1pMJguE9bNNVcFb0Mogr7FFeFbMC2az/F
         wJyQTC6eEc48KBCIaXK5wXdYv3ZErNO9aIN72OonlO8tI857cfSxgGQzLjER5jHW0VRJ
         ZIZu/1f9noOVM+b0mdnRT3/i1IwrrNdTwI5cprzQBLYYAzht+pFO9lTrTi+oiewPZ4O3
         kqxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=btGq6UFiQ6uZ4khGGxN4VPXYoggYsnaQyHGarwNW8j8=;
        b=harHmOPxsQ1tzqGboBAj+Hjy2KhwtI7OHezATZL++JT0fu2R3yHql1FrXqyJf/Nvdd
         UfuU0/WwBGd5M4Gr5iO2d7pBttqcebT50ltrLmB+qZmCZ319l5U6cinHVavcwcpKML9H
         YsPsWW2inlqe9aEuwbpRYiD+pyXObeQ6lZGdpjifK7V5huRBIRTCN1SgnZjM1Zl3lli8
         ossoN6xZH4PQAEUR1Qd/mrSSz6C7TXdQHTC0bkKZtfa797YdhJUogSe91gNlWtBtbe10
         8WUtmv8/ECMZ4vY64ZlACviry8HkG9Yt57MDVYd3gc9Jd5/ySU1hP0trrl1mm12RWPHz
         LNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=btGq6UFiQ6uZ4khGGxN4VPXYoggYsnaQyHGarwNW8j8=;
        b=FlXyKMrfAJlgGc8/kC9tusEDzRp33MnHI0m6Vcz9xoQIqEe/HmZzkG/NB93zU6kpuE
         jBdTfd7+qbm2V+yNXWBycwlyg8Jp7PxPU2yCUnGmmVbHGpn3UOXW01rjIKPPLXRxcMMj
         seP4xbJhu8UfwI+v3l9mDBkz29s870XyWcjKR5b7dFCZ4UIDLEVmziUr32PNA/qACRYt
         BAEYQaSHrHmgMyFwO1cceYOlAQBwM/TEEGxqI3jMMvK6JbmUbGb80MnIaFoQvKbI9mSF
         HukpLC7p3rpuM5drrhsh8nn8xCBB5kqrkk+SdVv9axu5c/vpRM14WLDhtX5OL5QtbmOs
         HGSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533xZzdsiMAx1kqO6/44AIJcLjpY3lRt/f5Zzn2KMa1EDXFdEIcu
	x8fURqu9HReuKbA1neRPukU=
X-Google-Smtp-Source: ABdhPJzvAI1VJstEpGwE5BI8E3uLlyJrsPip5Dcbbpf+rAyfcqvLO6BD87jG1q6i2WojVr0J2B7/UQ==
X-Received: by 2002:a25:e785:0:b0:647:a3a7:f06a with SMTP id e127-20020a25e785000000b00647a3a7f06amr23907282ybh.447.1652288978181;
        Wed, 11 May 2022 10:09:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:83c2:0:b0:648:ec33:b9c8 with SMTP id v2-20020a2583c2000000b00648ec33b9c8ls1974037ybm.8.gmail;
 Wed, 11 May 2022 10:09:37 -0700 (PDT)
X-Received: by 2002:a25:3206:0:b0:648:f57a:ffda with SMTP id y6-20020a253206000000b00648f57affdamr24559087yby.353.1652288977250;
        Wed, 11 May 2022 10:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652288977; cv=none;
        d=google.com; s=arc-20160816;
        b=l84qpOE/vYKmJO590xdNlwlOKjDpWvU0VGX2GUMtl/RAEByU0feGWN+z2ZjACjG/ED
         v5zboMLtgaq/AeqCAT/WGFC7sWW1VLQCcWypSA4CjscZ3UYt4v/CwWxNpUxOA1GcEzR0
         2K8lfKxx3SFquzdq0RZI7bHY3kA8+OOkfgHf5JSPD8NCki5pcpS5ElQK27nIqUSscruY
         j7kHlykiMOLeaujsQ9MdHa+uLUARXKCkCKtIT/XviG8WazK1mHGcs1sJKZ53pE3RxCl3
         gBlfrWxkDkUixX+p/lE7rkWtXQYMKvNAohd/zsrz7mASSgMBG82gk8mHmBsaRhYaXy5b
         t78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IEZbGBo/L/5UL2lyGkKjLkkTOwbgqgIRjFcuxMzEnXE=;
        b=R3QS/1NwSNCIXry2L1xKgmEvYM57FFIjk57Nk3BfgQ0vhmFbUKd/bRh9YdlzbCYeg1
         E1Whg9AwgNcLWv4cHuV5MOZhASc/ZlAf/rnEoPDE0bSWZfowf+q8wLW8S/Cdj8/79XOI
         HGDKoUaIKTyXFX1GeMskFfsZux2qa/n2I5mc3u+IbbvXNtt8uQBi2JluxTt31StyNsCh
         3tyJMAix4sBOjDkJFmQjr0xifkxwi+VH7YfnzxKo1vDb3KKy0W9Voh4jrYqmfbIGzy1H
         IC8UwGHJAVSwdgtOhBnOXAykuTSVw/PNiJdTC3UNQ3F59du9a6pp/a/4FgYKCIzHQYkh
         pG5w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FhR7oFMM;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com. [2607:f8b0:4864:20::112d])
        by gmr-mx.google.com with ESMTPS id y7-20020a05690213c700b0064a47ee8045si450800ybu.3.2022.05.11.10.09.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112d as permitted sender) client-ip=2607:f8b0:4864:20::112d;
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2ebf4b91212so28628087b3.8
        for <jailhouse-dev@googlegroups.com>; Wed, 11 May 2022 10:09:37 -0700 (PDT)
X-Received: by 2002:a0d:dd16:0:b0:2f4:dc1e:e0d8 with SMTP id
 g22-20020a0ddd16000000b002f4dc1ee0d8mr27006131ywe.413.1652288976988; Wed, 11
 May 2022 10:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com> <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
In-Reply-To: <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 11 May 2022 18:09:10 +0100
Message-ID: <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=FhR7oFMM;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::112d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi Jan,

On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 11.05.22 13:20, Prabhakar Lad wrote:
> > To add further more details:
> >
> > I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
> > for jailhouse [1].
> >
> > I added some debug prints and I see the panic is caused when entry()
> > function is called (in enter_hypervisor). The entry function lands into
> > assembly code (entry.S). I dont have a JTAG to see which exact
> > instruction is causing this issue.
>
> So, already the first instruction in the loaded hypervisor binary is not
> executable? That would explain why we see no hypervisor output at all.
>
To clarify when the hypervisor is loaded the output will be via
debug_console specified in the root cell config?

> Was that memory region properly reserved from Linux (via DTB carve-out
> e.g.)?
>
Yes I have the below memory reserved in my dts:

    memory@48000000 {
        device_type = "memory";
        /* first 128MB is reserved for secure area. */
        reg = <0x0 0x48000000 0x0 0x78000000>;
    };

    reserved-memory {
        #address-cells = <2>;
        #size-cells = <2>;
        ranges;

        jh_inmate@a7f00000 {
            status = "okay";
            no-map;
            reg = <0x00 0xa7f00000 0x00 0xf000000>;
        };

        jailhouse: jailhouse@b6f00000 {
            status = "okay";
            reg = <0x0 0xb6f00000 0x0 0x1000000>;
            no-map;
        };
    };

Linux does report the hole in RAM:

root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
48000000-a7efffff : System RAM
b7f00000-bfffffff : System RAM

And below is my root cell config related to hypervisor memory:

        .hypervisor_memory = {
            .phys_start = 0xb6f00000,
            .size =       0x1000000,
        },

Is there anything obvious I have missed above?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8sQAYXHykiGqn8DD8%3DcL4fv4NcszvgFgza2gE3_MCyRmQ%40mail.gmail.com.
