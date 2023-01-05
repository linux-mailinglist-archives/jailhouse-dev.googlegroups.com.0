Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBQNA3SOQMGQENFOIN6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C965F342
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Jan 2023 19:00:34 +0100 (CET)
Received: by mail-ej1-x63a.google.com with SMTP id sg39-20020a170907a42700b007c19b10a747sf23702812ejc.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Jan 2023 10:00:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672941634; cv=pass;
        d=google.com; s=arc-20160816;
        b=mKksWeXEcvC6E8JuLJoprCShhHwRlDUkPbtHqyJZgjRnFlzYy/7rjFnYDIFAYWv1/J
         L80KbFzYOlgaCxiLDs93aLMq8ghUhekzZSRqldZs4VtAJZkpkaqekP0MA++Ul5eDfbvU
         I8tVkIl5wzu7kUuepqSBfd/DhFy1gKaRVKdXShcpxSpiTM1Zlg8wGJEs4QU2IcY0+nUd
         JO4jnROvk9MpiZXdZvQvKjI5WZlNhVn0lfeLQa/FdZ8OdK4VSSOfdqDWx1ibxubAn7Mi
         ZMfMTMKmVcHHOjm78DTz/MydRGmn4xyj17nuRrjwDZpqcj8AaNK9oL159j5ngOr7aSV7
         TtoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=Mb6anboR8khRU20GMXtOmCQd3iXVmVgxaOkRA7cZsr8=;
        b=hcYS/HUtlFchk04fHoabxVaoUffywqTZTn2o63Eu5GtHc/9dsC6phm4pn3+a9y/pEc
         m8C1jLEei18Qz/uIFt841GTiwBI6FgClO8NRWAYJZZsK7GP6kYNWRLXFCCv8irIN4hxD
         USK293mRtVxLNl47FwcCprF0EP99dNYXG0sGjVd3rLBv3KdpiB7yCEXqkGxO2OpkeIkZ
         LKTz7nl+HEAwmc8CBBEElehx5Wx6SQIxIWMrH8tfb7fuiWXYEYMvkd/CZm7xL2B83pFG
         eaviGOQ9kZyAev9gCgwwRoZzBRzidweFGUwrOIha4Fjh+OFi7nbKniPYf2n8gSwebg5N
         suIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QzRQeoX0;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::32c as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mb6anboR8khRU20GMXtOmCQd3iXVmVgxaOkRA7cZsr8=;
        b=pMxCqiXdXHahuBS2p9PK6tBePrzKT46lrbEpKz7o2JUaXAlUi5DcFDtf9cNdApLoVl
         bTgLktx8vf+Y/Y7xY6xK4e6gRtZ/MAm2cWWne+0K+vcxQ29lnNxGh5T+Q7fAJ3zP4JeX
         Orxnq1kJMg+ebOZqs9aflnWwbk4Fv01cmJhmFsHMDQxYXU5pe/xGTtypGmDp9Flwf73/
         4zfo760Y8wzjNqzel+3d/SgM98nqcioxeoywcusn8aA4ZfTPZo1oWNUKuqeIqal5g89X
         mU0Y4qKnQiQSOOqtA6ubwbHM7p/lls9x0HN1scYC0+RaS2w+cf0YOEFJIx/jNs6U5faB
         TqlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mb6anboR8khRU20GMXtOmCQd3iXVmVgxaOkRA7cZsr8=;
        b=kxCD1XVimUv6rRVKb+yuEzRsOn/kaBZlptHGviIPoU75eG6RmIvUWRlsx2psrov1+K
         b0RN2f5CozMeDKXShGEKvnbIB39/XSw5jZ5VJ2+DAc6qUzO3sMvrZBjrtielmWgOiL5p
         PzawlzRCio88I0UB3ET9X30eVt4HsVOUjomso+ApoZUDuLGRtopuXOl6yiELHJVSOfLm
         yWLHpJrRX0U0IfvVWIHLYvOoREYXNy3/OiKS1a73tWArTt0bnuIUZunsrfoaTAtDpdp6
         aYmMt4W3K03cop32GvjcVoymmRpVxuXm4xvPqlna843wZ8vvc7KXYR3/xwXTeHq4Vr+s
         iN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mb6anboR8khRU20GMXtOmCQd3iXVmVgxaOkRA7cZsr8=;
        b=BzFSvYYJe0WhLI/lUVJS1tsHwHD/W7EScpkGKc4PXt6fbQUzB3Okk+fg1SfTUZGAkq
         FAdiRzyk9r9y412fBZWtNZnoTH03ib/ct/55advz+hc4jURbW5AAe6ZM4814p8QxagY2
         eIdHdfF1+Wj1jUl3gK7okDk9oXiCYv64AjSjshHhSgaBL8UfUEo4MNaRr25vEPX6mCov
         /WmE4sC9dEMIBvjefSr1iH1YssHzx1jEjruXZpmR6CW7I0RcOj/mobnxI79fiwpOyORW
         n+6tq/ciSYJf6npfDibHbc/eSQIHgLZMnksX1bRoTiXT04dDR+QpsTbCQK9rBu9RvRLb
         K3KQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kokfi1RWxEXtIx2iYJG3iw4PgPK865hkCx4CcKn3/JuO9It1XVG
	dnaNdMz12iDzLZ2pJZZ5ySU=
X-Google-Smtp-Source: AMrXdXtpqsM5x9JZroa2ryU8rAowKPuNH3+yBzRaeDTFE4UjQedxdVtOHkj5tjoiGhIoIRtTzS2jGw==
X-Received: by 2002:aa7:d645:0:b0:47d:868e:3a0e with SMTP id v5-20020aa7d645000000b0047d868e3a0emr6430637edr.36.1672941634387;
        Thu, 05 Jan 2023 10:00:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:40d5:b0:479:6c1:ef04 with SMTP id
 z21-20020a05640240d500b0047906c1ef04ls2061024edb.0.-pod-prod-gmail; Thu, 05
 Jan 2023 10:00:32 -0800 (PST)
X-Received: by 2002:a05:6402:4506:b0:46d:35f6:5a9b with SMTP id ez6-20020a056402450600b0046d35f65a9bmr4972519edb.24.1672941632936;
        Thu, 05 Jan 2023 10:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672941632; cv=none;
        d=google.com; s=arc-20160816;
        b=H+LjD+6iRIJDxLYy9ICIfnri/fYmc6SaCQZpJD4BBt75azr4DDwQv/u1o6/StwLIw3
         q2gzpL5qHdpzGMCuDmbut49qaCEHckW0ZpJJW+ECr5YyTAv7Gq9mGelxe1Jhe75ymxSd
         tkfer7dJGEn+aRuW9aIkdoSyM+nh2aApfnLaxUSXjc/8zYgkJbpN+LDp6OvmDFGGeF2a
         yu7Ts41ueVUVvk3xfsC6M2caDXXIs1z/12E6dLdqzKgP4ynXNP9WZV06/Lf1XCbqPLz3
         OPi2iW62RgL/u6KN9nWsvyQ8YbHXiquVPzk9NCmyRMnMJRZbRIxIIymkumMUyigveFrl
         Qrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NkN9weGwigqm8bcfZsiENLLRNjm2KNoUfcGD4VJxAJk=;
        b=LlMq1etm4NKWNJ4p0jDhvFRd4XhtG7e3A6ZZ+Eh2EJoWo8WmLch+ClaJm1I2sYT8E5
         xHY9LqWMbkxoxDQ5d+JRefF0q7IXlWcUbRVfXOW7I8qHWh2k+CBGcegbTCoQkD0XEe+b
         m0wGQ1hFbehYm5XlrsvEUKrlCmul0ZjWzT++dYETTprbX8UoBrU4VnKCwd3g2cBUPiHb
         Fswh4wpIMLAa28czJWWfO6Dv4vkICo20Rx4IOYUKg/K74FsHZF/tmY7PPbEeLTH5Cgyd
         5AKIInHCmi8cZzrn4hakThYD3TDrcfj5+y6zH2IwxqXzGIU0oz9mIWxONdp9M1QDxVPm
         ilLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QzRQeoX0;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::32c as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com. [2a00:1450:4864:20::32c])
        by gmr-mx.google.com with ESMTPS id r8-20020aa7d148000000b0048ecd372fccsi315939edo.5.2023.01.05.10.00.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 10:00:32 -0800 (PST)
Received-SPF: pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::32c as permitted sender) client-ip=2a00:1450:4864:20::32c;
Received: by mail-wm1-x32c.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so1920904wmb.2
        for <jailhouse-dev@googlegroups.com>; Thu, 05 Jan 2023 10:00:32 -0800 (PST)
X-Received: by 2002:a7b:c4da:0:b0:3cf:4757:fc3 with SMTP id
 g26-20020a7bc4da000000b003cf47570fc3mr3023426wmk.172.1672941632597; Thu, 05
 Jan 2023 10:00:32 -0800 (PST)
MIME-Version: 1.0
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com> <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com> <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
 <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com> <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
 <CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg@mail.gmail.com>
 <82959f20-2de7-5d7b-ce9b-cb8aa1476c32@siemens.com> <a4c03581-e791-6448-92be-c51e896be4bd@oth-regensburg.de>
In-Reply-To: <a4c03581-e791-6448-92be-c51e896be4bd@oth-regensburg.de>
From: Tommi Parkkila <tommi.parkkila@gmail.com>
Date: Thu, 5 Jan 2023 13:00:21 -0500
Message-ID: <CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-wxc6YOZsg@mail.gmail.com>
Subject: Re: STM32MP1 hangs on when entering hypervisor
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000bdb15c05f18813f7"
X-Original-Sender: Tommi.Parkkila@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=QzRQeoX0;       spf=pass
 (google.com: domain of tommi.parkkila@gmail.com designates
 2a00:1450:4864:20::32c as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
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

--000000000000bdb15c05f18813f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ralf - Not sure what you mean by your note.

Jan - root cell configuration is now fixed what comes to overlapped memory
regions. However, the both issues: *1. Terminal hangs*, and *2. Issue with
setting CPU clock* still exists. I am not familiar with clock
configurations on the target, but yes TF-A is in use.

-tommi

to 5. tammik. 2023 klo 12.54 Ralf Ramsauer (ralf.ramsauer@oth-regensburg.de=
)
kirjoitti:

>
>
> On 05/01/2023 18:24, Jan Kiszka wrote:
> > On 05.01.23 18:21, Tommi Parkkila wrote:
> >> Oh, I was missing *.cell from the point 2. Now fixed and no complaints=
.
> >>
> >> to 5. tammik. 2023 klo 12.20 Tommi Parkkila (tommi.parkkila@gmail.com
> >> <mailto:tommi.parkkila@gmail.com>) kirjoitti:
> >>
> >>      Jan - Just ran the config check on the host PC and on target.
> >>
> >>      1. On host, it identified some memregion overlappings that were d=
ue
> >>      my own copy/paste errors. It also complained a missing resource
> >>      interception for architecture x86:
> >>      */In cell 'STM32MP1-Root', region 1
> >>        phys_start: 0x00000000f7600000
> >>        virt_start: 0x00000000f7600000
> >>        size:       0x0000000009a00000
> >>        flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >>      JAILHOUSE_MEM_EXECUTE
> >>      overlaps with xAPIC
> >
> > Another detail when running cross: "-a arm" - you don't have to worry
> > about x86 resources on your target.
>
> Side note: We should store the architecture in the configuration. Just
> for the same reason why we introduced the magic byte at the beginning=E2=
=80=A6
>
>    Ralf
>
> >
> > Jan
> >
> >>        phys_start: 0x00000000fee00000
> >>        virt_start: 0x00000000fee00000
> >>        size:       0x0000000000001000
> >>        flags:  /*
> >>      I fixed the copy paste mem overlappings, do I need to worry about
> >>      the xAPIC overlapping?
> >>      */
> >>      /*
> >>      2. On target, the check complained the configuration is not root
> >>      cell configuration???
> >>      */root@stm32mp1:~# jailhouse/tools/jailhouse-config-check
> >>      jailhouse/configs/stm32mp157.c
> >>      Reading configuration set:
> >>      Not a root cell configuration: jailhouse/configs/arm/stm32mp157.c=
/*
> >>      The config here is the same as ran on the host PC. What causes it
> to
> >>      complain the above?
> >>
> >>      to 5. tammik. 2023 klo 11.55 Jan Kiszka (jan.kiszka@siemens.com
> >>      <mailto:jan.kiszka@siemens.com>) kirjoitti:
> >>
> >>          On 05.01.23 17:53, Tommi Parkkila wrote:
> >>          > Jan - Thanks again. I have not tried the config check yet.
> >>          Actually, it
> >>          > does not work on hw currently, it does not find pyjailhouse
> >>          module. I'll
> >>          > check whats going wrong with it and let you know.
> >>
> >>          You can also run it offline, even directly from the source
> folder
> >>          (tools/jailhouse-config-check ...).
> >>
> >>          Jan
> >>
> >>          > -tommi
> >>          >
> >>          > to 5. tammik. 2023 klo 10.21 Jan Kiszka
> >>          (jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>
> >>          > <mailto:jan.kiszka@siemens.com
> >>          <mailto:jan.kiszka@siemens.com>>) kirjoitti:
> >>          >
> >>          >     On 05.01.23 15:34, Tommi Parkkila wrote:
> >>          >     > Thanks for your reply, Jan. I managed to get forward
> >>          from the 'hang'
> >>          >     > condition. There were several misdefinitions on my
> root-cell
> >>          >     > configuration. Now I get the root-cell started
> >>          sometimes, but more
> >>          >     often
> >>          >     > I get two types of issues after enable command. Any
> help
> >>          or ideas
> >>          >     where
> >>          >     > to continue my debugging would be greatly appreciated=
.
> >>          Please, see the
> >>          >     > issues explained below.
> >>          >
> >>          >     Already tried "jailhouse config check"?
> >>          >
> >>          >     >
> >>          >     > Thanks,
> >>          >     > -tommi
> >>          >     >
> >>          >     > +++++++++++++++++++++++++++++++++
> >>          >     >
> >>          >     > 1. Terminal hangs
> >>          >     > -- After the enable command for the root cell,
> jailhouse
> >>          gets started
> >>          >     > but then the terminal goes unresponsive. Below, examp=
le
> >>          log, where I
> >>          >     > give ls cmd, which then causes terminal to go
> >>          unresponsive...:
> >>          >     >
> >>          >
> >>          >     Missing interrupts could be one reason. Or something is
> >>          completely
> >>          >     broken with memory mapping so that a kernel device driv=
er
> >>          gets stuck on
> >>          >     waiting for some register bit to flip, e.g. But most
> >>          frequent are
> >>          >     interrupt issues, specifically around GIC resources bei=
ng
> >>          improperly
> >>          >     passed through. The config checker may find that.
> >>          >
> >>          >     > /*root@stm32mp1:~# modprobe jailhouse
> >>          >     > [ 1315.034414] jailhouse: loading out-of-tree module
> >>          taints kernel.
> >>          >     > root@stm32mp1:~# jailhouse enable
> >>          >     > ~/jailhouse/configs/arm/itron_stm32mp157.cell
> >>          >     >
> >>          >     > Initializing Jailhouse hypervisor v0.12
> >>          (314-gc7a1b697-dirty) on CPU 0
> >>          >     > Code location: 0xf0000040
> >>          >     > Page pool usage after early setup: mem 28/1514, remap
> >>          0/131072
> >>          >     > Initializing processors:
> >>          >     >  CPU 0... OK
> >>          >     >  CPU 1... OK
> >>          >     > Initializing unit: irqchip
> >>          >     > Initializing unit: PCI
> >>          >     > Page pool usage after late setup: mem 50/1514, remap
> >>          5/131072
> >>          >     > [0] Activating hypervisor
> >>          >     > [ 1355.352714] The Jailhouse is opening.
> >>          >     > root@stm32mp1:~# ls*/
> >>          >     >
> >>          >     > 2. Issue with setting CPU clock
> >>          >     > -- The second issue I see is related to i2c bus and
> >>          system clock.
> >>          >     > Terminal starts printing error statements infinitely
> >>          after Jailhouse
> >>          >     > opening. Below, is a snippet of an example logs.
> >>          >     >
> >>          >     > */[   85.322027] The Jailhouse is opening.
> >>          >     > [   85.322648] stm32f7-i2c 5c002000.i2c: failed to
> >>          prepare_enable
> >>          >     clock
> >>          >     > root@stm32mp1:~# [   85.339233] cpu cpu0:
> >>          _set_opp_voltage: failed to
> >>          >     > set voltage (1350000 1350000 1350000 mV): -22
> >>          >     > [   85.350413] cpufreq: __target_index: Failed to
> change cpu
> >>          >     frequency: -22
> >>          >     > [   85.357706] cpu cpu0: _set_opp_voltage: failed to
> set
> >>          voltage
> >>          >     > (1350000 1350000 1350000 mV): -22
> >>          >     > [   85.365124] cpufreq: __target_index: Failed to
> change cpu
> >>          >     frequency: -22
> >>          >     > [   85.381985] cpu cpu0: _set_opp_voltage: failed to
> set
> >>          voltage
> >>          >     > (1350000 1350000 1350000 mV): -22
> >>          >     > /*- - -
> >>          >     > +++++++++++++++++++++++++++++++++
> >>          >
> >>          >     Same possible reasons as above. Or do you know how cloc=
k
> >>          control happens
> >>          >     on that platform? Is there firmware (TF-A?) involved?
> >>          >
> >>          >     Jan
> >>          >
> >>          >     --
> >>          >     Siemens AG, Technology
> >>          >     Competence Center Embedded Linux
> >>          >
> >>
> >>          --
> >>          Siemens AG, Technology
> >>          Competence Center Embedded Linux
> >>
> >
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-wxc6YOZsg%40mail.gm=
ail.com.

--000000000000bdb15c05f18813f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ralf - Not sure what you mean by your note.<div><br></div>=
<div>Jan - root cell configuration is now fixed what comes to overlapped me=
mory regions. However, the=C2=A0both issues: <b><i>1. Terminal hangs</i></b=
>, and <b><i>2. Issue with setting CPU clock</i></b> still exists. I am not=
 familiar with clock configurations on the target, but yes TF-A is in use.<=
/div><div><br></div><div>-tommi</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">to 5. tammik. 2023 klo 12.54 Ralf Rams=
auer (<a href=3D"mailto:ralf.ramsauer@oth-regensburg.de">ralf.ramsauer@oth-=
regensburg.de</a>) kirjoitti:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
<br>
On 05/01/2023 18:24, Jan Kiszka wrote:<br>
&gt; On 05.01.23 18:21, Tommi Parkkila wrote:<br>
&gt;&gt; Oh, I was missing *.cell from the point 2. Now fixed=C2=A0and no c=
omplaints.<br>
&gt;&gt;<br>
&gt;&gt; to 5. tammik. 2023 klo 12.20 Tommi Parkkila (<a href=3D"mailto:tom=
mi.parkkila@gmail.com" target=3D"_blank">tommi.parkkila@gmail.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:tommi.parkkila@gmail.com" target=3D"_=
blank">tommi.parkkila@gmail.com</a>&gt;) kirjoitti:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Jan - Just ran the config check on the host PC=
 and on target.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 1. On host, it identified some memregion overl=
appings that were due<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 my own copy/paste errors. It also complained a=
 missing resource<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 interception for architecture x86:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 */In cell &#39;STM32MP1-Root&#39;, region 1<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_start: 0x00000000f7600000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_start: 0x00000000f7600000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000009=
a00000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags: =C2=A0 =C2=A0 =C2=A0JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE |<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 JAILHOUSE_MEM_EXECUTE<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 overlaps with xAPIC<br>
&gt; <br>
&gt; Another detail when running cross: &quot;-a arm&quot; - you don&#39;t =
have to worry<br>
&gt; about x86 resources on your target.<br>
<br>
Side note: We should store the architecture in the configuration. Just <br>
for the same reason why we introduced the magic byte at the beginning=E2=80=
=A6<br>
<br>
=C2=A0 =C2=A0Ralf<br>
<br>
&gt; <br>
&gt; Jan<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 phys_start: 0x00000000fee00000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 virt_start: 0x00000000fee00000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 size: =C2=A0 =C2=A0 =C2=A0 0x0000000000=
001000<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags:=C2=A0=C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I fixed the copy paste mem=C2=A0overlappings, =
do I need to worry about<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 the xAPIC overlapping?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 2. On target, the check complained the configu=
ration is not root<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cell configuration???<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 */root@stm32mp1:~# jailhouse/tools/jailhouse-c=
onfig-check<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 jailhouse/configs/stm32mp157.c<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Reading configuration set:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Not a root cell configuration: jailhouse/confi=
gs/arm/stm32mp157.c/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 The config here is the same as ran on the host=
 PC. What causes it to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 complain the above?<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 to 5. tammik. 2023 klo 11.55 Jan Kiszka (<a hr=
ef=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.c=
om</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:jan.kiszka@siemen=
s.com" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;) kirjoitti:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 On 05.01.23 17:53, Tommi Parkkil=
a wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Jan - Thanks again. I have =
not tried the config check yet.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Actually, it<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; does not work on hw current=
ly, it does not find pyjailhouse<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module. I&#39;ll<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; check whats=C2=A0going wron=
g with it and=C2=A0let you know.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 You can also run it offline, eve=
n directly from the source folder<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tools/jailhouse-config-check ..=
.).<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Jan<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; -tommi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; to 5. tammik. 2023 klo 10.2=
1 Jan Kiszka<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (<a href=3D"mailto:jan.kiszka@si=
emens.com" target=3D"_blank">jan.kiszka@siemens.com</a> &lt;mailto:<a href=
=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com=
</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailt=
o:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:jan=
.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;&gt;) =
kirjoitti:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 05.01=
.23 15:34, Tommi Parkkila wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Tha=
nks for your reply, Jan. I managed to get forward<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from the &#39;hang&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; con=
dition. There were several misdefinitions on my root-cell<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; con=
figuration. Now I get the root-cell started<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sometimes, but more<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0often<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; I g=
et two types of issues after enable command. Any help<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 or ideas<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0where<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; to =
continue my debugging would be greatly appreciated.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Please, see the<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; iss=
ues explained below.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Already =
tried &quot;jailhouse config check&quot;?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Tha=
nks,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; -to=
mmi<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++=
++++++++++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. =
Terminal hangs<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; -- =
After the enable command for the root cell, jailhouse<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gets started<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; but=
 then the terminal goes unresponsive. Below, example<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log, where I<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; giv=
e ls cmd, which then causes terminal to go<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unresponsive...:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Missing =
interrupts could be one reason. Or something is<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 completely<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0broken w=
ith memory mapping so that a kernel device driver<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gets stuck on<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0waiting =
for some register bit to flip, e.g. But most<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 frequent are<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0interrup=
t issues, specifically around GIC resources being<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 improperly<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0passed t=
hrough. The config checker may find that.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; /*r=
oot@stm32mp1:~# modprobe jailhouse<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1=
315.034414] jailhouse: loading out-of-tree module<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 taints kernel.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; roo=
t@stm32mp1:~# jailhouse enable<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; ~/j=
ailhouse/configs/arm/itron_stm32mp157.cell<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ini=
tializing Jailhouse hypervisor v0.12<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (314-gc7a1b697-dirty) on CPU 0<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Cod=
e location: 0xf0000040<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Pag=
e pool usage after early setup: mem 28/1514, remap<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0/131072<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ini=
tializing processors:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=
=A0CPU 0... OK<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=
=A0CPU 1... OK<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ini=
tializing unit: irqchip<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ini=
tializing unit: PCI<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Pag=
e pool usage after late setup: mem 50/1514, remap<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5/131072<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [0]=
 Activating hypervisor<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1=
355.352714] The Jailhouse is opening.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; roo=
t@stm32mp1:~# ls*/<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. =
Issue with setting CPU clock<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; -- =
The second issue I see is related to i2c bus and<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system clock.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Ter=
minal starts printing error statements infinitely<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 after Jailhouse<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; ope=
ning. Below, is a snippet of an example logs.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; */[=
 =C2=A0 85.322027] The Jailhouse is opening.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.322648] stm32f7-i2c 5c002000.i2c: failed to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_enable<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0clock<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; roo=
t@stm32mp1:~# [ =C2=A0 85.339233] cpu cpu0:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _set_opp_voltage: failed to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; set=
 voltage (1350000 1350000 1350000 mV): -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.350413] cpufreq: __target_index: Failed to change cpu<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0frequenc=
y: -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.357706] cpu cpu0: _set_opp_voltage: failed to set<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; (13=
50000 1350000 1350000 mV): -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.365124] cpufreq: __target_index: Failed to change cpu<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0frequenc=
y: -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =
=C2=A0 85.381985] cpu cpu0: _set_opp_voltage: failed to set<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 voltage<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; (13=
50000 1350000 1350000 mV): -22<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; /*-=
 - -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++=
++++++++++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Same pos=
sible reasons as above. Or do you know how clock<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 control happens<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0on that =
platform? Is there firmware (TF-A?) involved?<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Siemens =
AG, Technology<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Competen=
ce Center Embedded Linux<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Siemens AG, Technology<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Competence Center Embedded Linux=
<br>
&gt;&gt;<br>
&gt; <br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-wxc6YOZs=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-w=
xc6YOZsg%40mail.gmail.com</a>.<br />

--000000000000bdb15c05f18813f7--
