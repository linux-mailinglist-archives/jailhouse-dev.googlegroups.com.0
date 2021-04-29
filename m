Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBW5XVOCAMGQE2LLQDLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D2836EDFA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Apr 2021 18:16:28 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id h7-20020ac24da70000b02901bf8e1cde13sf3422706lfe.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Apr 2021 09:16:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619712987; cv=pass;
        d=google.com; s=arc-20160816;
        b=FDmTIlWQrzFcrqPRERgWZGZeOKmZ8owhcobj2gMRaJR1I+XrIv5mnnPhB1JjP1dieH
         hgnrk65GhCJEAI9Inb56wUOaiEttrm+zXpCRUOO4hu9SyyWwl1M+OL4uBrBWmHc6UCJR
         pwh4UDMLbpyEbHL5oUP/LGIf0oNIY3CnHgf0zZ4lSLTsdo3YRGX+iF2/Cc4ocCuaXWhd
         s83AT34EHEBJKWgMqiGnqJ6YWDtYGHhLvUGWXCPXitROSTg2xzwIDSGUEPQDM+ukOIiN
         LlOslwuoFE7BOer8jaoihiRB6JzHYsgq70Tb5dWQmu8eWEqto4XDnwrgYsNs1qQDiA9j
         3fwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=V1mn80vFMpLLlZ27c99Rx4TjIBjiu3/SfklvGtxXvHY=;
        b=IAZ6rcSt1qwDT02EPPdRvsBxUGSE+p7gKzNeuz2+7zQKqRUGLek7lmoPB4ldmhWjgJ
         HJ+ums8wHMJf2JkGWvlZxk5AjLJglcIlUmVHgiGY8djlNeREEjBBWnXEdxZWYN6me8U+
         hjM0ITCfmpCCpYMliuwe7sQ84oXs301lbhnRwWbE5XOQ9DMu5Q9f19S3fWSkxGj0RTy8
         hxsSNgMpG+fDlEXWPfHs9jrRwCbdFyuOaCTnVh21XA2Hr7tGsN3nyt19GrcuHB6Bp6IP
         7D7yq3FW2V7DXVmGyfTTlCg5qCOg7/Gb74MM8lqjmCD8jhTWN6WItHt+Ke3EvoQtvIkK
         4Deg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=m3rO7dei;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V1mn80vFMpLLlZ27c99Rx4TjIBjiu3/SfklvGtxXvHY=;
        b=K1zIDV5uwUMkHctD1zI6MnoZocY258LDBYPGZ30ohyZRtcwclGawI7KZixn0grnMP5
         Cjds//WTrJMoGzstcFDDFjmdOk79U6tu4XS4jQcyuVHyAQxsKGKKRdojD8x298d6ZrQg
         QaAIpnX9QHkHYEcqA6KqhuArAnOsqd7tmrWP/ISZxzmSPt4AJ8Dzn7TMFrZjXfBu8Gwo
         OkpzzHgN+9CT6/95h9uwHrPOHNtRAV5saKe5luf9Gecacgd9CG2InUWBVUfsgRenWvRZ
         C65AsH6f6BpyoRcz78Ej+s6DgfoWLlUVzpmLxiZjRVHsp33TkJNSuCciJVFAoFIQSfxY
         sp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=V1mn80vFMpLLlZ27c99Rx4TjIBjiu3/SfklvGtxXvHY=;
        b=J6ajzScxrlk646gDbA7mywiReskpZg/Xi8+At+SGXN08WWBS7RjaHsAIQvyHoTsRGZ
         KDMr4qARG7CjXqBWprjal7nIeGwEqZIinGri6NWoVM56gFbbsBjFWOpj3HLtjnlqvNVr
         chcxizNcvwksHnfxRgwv4l6AueQe3H+HwCJO27mlf5h+P8G0DX98F8T1Nd61UPrx+eJc
         UAgKnLgx94GxKwJtE69FmT+DUZbgSip/Hn8sZ3Mm3TG8FcWVqoXP2oz4umdhdmVqZn8k
         y8ZrQH6XmRkUrBj0csKWYWFa5/CXBw83S3rGs8kZCBdqcW/rxxyqon7rlvF0LGMQBcD/
         WeIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530XVgAHp7dkauoB8RtATpDIrVtDPp8yNLtmhFozojm5qNrYkD3b
	FEpbNimb3X8FJWeE1iDl6IQ=
X-Google-Smtp-Source: ABdhPJxLqzMmObC6732JVmYUtlxzOwVFJZTnxA2Mm9cK9DWQyd0i4+EsCxLV9UFMukAKgCd4Ibe5YQ==
X-Received: by 2002:a05:651c:211e:: with SMTP id a30mr346024ljq.18.1619712987792;
        Thu, 29 Apr 2021 09:16:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5624:: with SMTP id b4ls580934lff.0.gmail; Thu, 29 Apr
 2021 09:16:26 -0700 (PDT)
X-Received: by 2002:a05:6512:3ca0:: with SMTP id h32mr258521lfv.184.1619712986173;
        Thu, 29 Apr 2021 09:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619712986; cv=none;
        d=google.com; s=arc-20160816;
        b=rDLjcYe/F7Qqdif461Vti70+16/sSTwXLX5Quqs4+h5HCM/hZvmqpvuuzL+AgjvJOb
         0rRXP+N53Cr0RLQkNlLu7RmBeRMyITCwFzgrRTjPIwRq17ZVQezEQlgvYhEPrMdUUGUd
         uMA7dEYIEeeNv3p6TZRArtf5PregcuG0SMaj3p2IAPX7f+wDMuUzNU7uIy7yA6kGXvfL
         qPhVtE+1aVI+soPDdllBGpCHwVTOaXxU65ATvYE1EbPm0TQoXc1oEByhPLD88MHDhMZX
         TzD2RuQN0kJUx+fEoOq568AZXcjgiAzumN62EGEj3zTyK1oElryVbw86z4uKIscH7zTx
         lSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=fF/gqINJql/4j/wTRKGmdeFhKAPPe5ZMVaWa3mnoKjo=;
        b=DhuYNMWVRGfTNfOTxOF7NOAekadbR++YDr3b+GflCRS+oeHnuLSP+kT0MMsX69MUzO
         uCIYAZ/gbGewAEzEAUtP8WK0ngXviCUgaM8CTaqkUGhf8EWRli/EYr+CFBI8lLopyRhd
         ofWEC17OBjduqtgWNBVdvdWPrbPgFzk72pkz85KCLaoRrH8LAD7dxeq2vbTbpDMCq12e
         JZ4VPoVXh9BKdyfZtgsg/EYghn9y853XxriHYt1IMUnjAsh2Zv65PuWhtuUi0soHg54T
         bW7JX5cQkrkE8kJbSogTFIVtWjy8HlgKmxIhctWL6F0HZa6B2LNymffN8GdLELJuPIHn
         WjKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=m3rO7dei;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id z33si17097lfu.12.2021.04.29.09.16.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Apr 2021 09:16:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4FWLGd2Y7vzy6b;
	Thu, 29 Apr 2021 18:16:25 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 29 Apr
 2021 18:16:25 +0200
Subject: Re: use uart3 from inmate cell
To: Stefano Gurrieri <gurrieristefano@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <eec6d53b-a974-69cb-6a0a-302db90b14f6@oth-regensburg.de>
Date: Thu, 29 Apr 2021 18:16:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <dd1ffb4f-3c78-4a8d-9982-7b589e0f3754n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=m3rO7dei;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Stefano,

On 29/04/2021 10:45, Stefano Gurrieri wrote:
> Hello,
>=20
> I=E2=80=99ve experimented succefully jailhouse on my target (var-som-mx8m=
-mini +
> symphony carrier board); specifically I=E2=80=99ve tested a second linux =
and
> other demos (ivshmem-demo, gic-demo...).=C2=A0
>=20
> Furthermore, I=E2=80=99ve cross-compiled a very easy bare-metal applicati=
on, but
> I=E2=80=99m not able to use UART3 (second uart) from this cell (linux roo=
t cell
> send correctly debug messages on UART4 -first uart-). Attached you can fi=
nd:
>=20
> -=C2=A0*imx8mm-uart-demo.c*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 my=C2=A0config cell
>=20
> -=C2=A0*uart-demo.c*=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0demo loaded into
> inmate cell
>=20
> Runtime, after enabling jailhouse, I enter:
>=20
> jailhouse cell create /usr/share/jailhouse/cells/imx8mm-uart-demo.cell
>=20
> jailhouse cell load 1 /usr/share/jailhouse/inmates/uart-demo.bin
>=20
> jailhouse cell start 1
>=20
> In theory, I should be able to see =E2=80=9C/printk(=E2=80=9Dblablabla=E2=
=80=9D)/=C2=A0messages on my
> uart3 console (the second serial console), but I don=E2=80=99t see anythi=
ng.
>=20
> ***
>=20
> Questions:
>=20
> 1. Have you some idea? What I got wrong?
>=20
> 2. The config cell seems correct, but I=E2=80=99m asking who initialize u=
art3
> serial? Linux? Because if it=E2=80=99s linux, the uart3 is disabled in th=
e dtb.
> Is it possible initialize uart3 serial also into jailhouse?

If it's disabled in the DT, and nobody initialised it before, then yes,
there's a certain chance that the UART arrives unconfigured in the cell.

Have a look at inmates/lib/arm-common/uart-imx.c . The init routine
currently does nothing. IOW, you either need to patch the driver and add
optional initialisation (you can have a look at other drivers, there are
already appropriate fields in the config structures for uart
configuration), or rely on Linux to hand it over initialised.

  Ralf

>=20
> Thanks a lot for your help in advance!
>=20
> Kind regards.
>=20
> Stefano
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-7=
b589e0f3754n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/dd1ffb4f-3c78-4a8d-9982-=
7b589e0f3754n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eec6d53b-a974-69cb-6a0a-302db90b14f6%40oth-regensburg.de.
