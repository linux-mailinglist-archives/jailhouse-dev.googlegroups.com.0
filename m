Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBYF7Q3WQKGQEXXBVCGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 23875D4EAD
	for <lists+jailhouse-dev@lfdr.de>; Sat, 12 Oct 2019 11:41:53 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id v24sf2344671ljh.23
        for <lists+jailhouse-dev@lfdr.de>; Sat, 12 Oct 2019 02:41:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570873312; cv=pass;
        d=google.com; s=arc-20160816;
        b=pM19iXCRTopcxZYL2iwoXLCCIZS5PTp2YS1s1pehDDHyy++EewVJ3LBTkj6AJfVsvb
         qaO1my+S0N2kqTrzQRBQR0vJDDD+W0KTYd8in59G3D68d1GN6aoZ7aV3DoXGJWkCy/+w
         /GHuzlg2D8bIyRTVhmsGzraBsP4fjbaUPrmz/nNKjO6OXxVBUEQrcE9ecFlxEobXUKdJ
         ENzowhmFKJfJndJKu86gNbvfz/ZkvaqoWoXWrZsMPjkYLK0Dw5GQdVqZOm07I39YlooH
         scGHSG/NwFdpq3AAcDaUSK28gudFeHQ80/hy9IVTlOK4dgJK3cChikmujqZBqtfsgJ2J
         3JxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=yquhXWmHVQTc5UMqqhye3fkNaVMlTg3Vo6sZ2DkSiZU=;
        b=qwe9o2ETA/rQiGxvgk7UonRO2WBs9SkoWWb1wp16IGhBl07dmezDnGLfmUN81zNa9k
         T35iEe9jRie84fRf/TuiszQNNEsjERpCrD6KrabuWn4+OVfH1j7gS74re2P0XSELEx7q
         pzImAw6QclXUlndnV84NwaLwZoFDSW/LZAJinjNp/XBdYoNNMcI47hcQnGJEdo/Yc40g
         Y1KleXMEBMcvd6WbRo8261xOuxuI0VAAyJ2/Cqe37EK983OoirfCi5UcBhVKCe37tDzi
         hgXtQVj30Xficu+vv1t07LAP/dBQ09gdEJJWudqYm0J1OLw5O/6HAp7zihNkZTpnrlMf
         NF0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="eV6/zAHs";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yquhXWmHVQTc5UMqqhye3fkNaVMlTg3Vo6sZ2DkSiZU=;
        b=mHKEhN5FBmqRA6OZCEC4t6NPPvYR9e2dfzyOx+Mco8rUSaU+mdVARE2irhGnLEzADk
         XoaOCWAnNiMwnY6GoUtHjTwpiloqmqL8K3W39hD0DITwb5D2NudrmupkDXTWkuLdw2JD
         asAjOVOA40XlFwDLaCeqXR9fE+2+PrSZJHRgTkY/rDWWjvEorNJsSyfJSY6jPUv4a3PR
         qCnCQ/asRg5Rzn5bKISsnbo52l99+rC4o7jQo0Chnsg78thJF6JfEaehEmFAYLV8vcXp
         cFXsMkm14LdD5grugb3phnGfV02jPo/EN5CnoDVnnS6yMvcALXFenlk/pk32RnVpoBnw
         UWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yquhXWmHVQTc5UMqqhye3fkNaVMlTg3Vo6sZ2DkSiZU=;
        b=Zq4hNcT0yAqrjJdr+9is53U579U5HwSD5AUWMldYjdsaoxIctiZVY2LUcwO9YPKLT0
         3fZjSbKYGXUlThyfeWND3OitC4kc7QFGGh1FZ4UImVoFm0mWSvbizNA1XcwAdFD/IROs
         DftX3h0rXSRV/sv9p5p7N/YDakf1Jo+MvYq9iBBp7z4/qEXUHy6qbnlcyGQNaNdphpsP
         vBUZvfx/74Y1F0mXtPNM/rHTcZ1T3Cl4nxd0CHhdkZR8C74T8wOzW9oTVSjzCgBk95WJ
         +0+aW/fpiai2UtZuiORg+0MuiqhvYE81EwKIpZJdOyMkkCrPaG5lwP336wblsOZExyyf
         ZzHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWELNI3O0x9NZjHlpUim2juqyX0mGZPeeDBaQ8BsjfBlRsEC/Ji
	PKVu+Prvv+b6OnwttH1YFbg=
X-Google-Smtp-Source: APXvYqxti11UDhYt0LDaMnHAnY4HDZCMdM0CLAdG6b5bYePFVtRm060Z+6ySLSK6q9BV25yMA+nauA==
X-Received: by 2002:a19:ac46:: with SMTP id r6mr11276771lfc.127.1570873312661;
        Sat, 12 Oct 2019 02:41:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5f55:: with SMTP id a21ls924750lfj.0.gmail; Sat, 12 Oct
 2019 02:41:51 -0700 (PDT)
X-Received: by 2002:ac2:5b4d:: with SMTP id i13mr11817621lfp.186.1570873311800;
        Sat, 12 Oct 2019 02:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570873311; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWZIBTLplj2jfFC36hAn+lUFDvdg7p5QluC4NhZSM+Q13I/ahfufMEdDLdzfzJ3ddG
         wTTZeph9t9ANzSakbh50dbo+SugWguMLTAyMjoom7vtjJsujcO9OOdQUDV+ybH39lSho
         zSfEsj9ULpFvs8Z0K7MYDoA2CNKZRE/pbprQAdAv7AwPv2N3CpUAkmjoSL1DfJt/oar+
         chqs5hrCN8z1xVj/GGSZvIWYoTWaHmCm+QGyHfHGFDrOFmSXr76htY3SW9vDMj3KC2Gr
         Q7waXOWO281sGV1vueU20DpGPa7s0Ky1iMRwE5rh7mJVWFBFyGSQf8wgcYDWGkAmCwko
         bX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FqwEsHnruOsEiNWeZVZnFxiKzDf+fhgRqNlAY+R7lnw=;
        b=m/u2tsYpg3pNH1OLd2UcHG3rgD0yY/byiXt3Nb590meLrxqVVoF3wmaaidobRuw3qA
         Eth5FfFFvIk64kmUyxAh01EhDfjY42CPZrNgr2qtQiiCCarVBg7NGzRx+OTwozb7hycC
         ExzJLFcuVxULK2ACPj6XyRunvF9Wi8Ngwbb7CIFkWN6DgdIQFSlQVdIuKbXIzY7ej2Of
         LTGnwyPjMYxO0REa+KYFH6esr4htn67BELHnE/jr15TbM8zUYRRjIyP5nbEkg0Hy9+j2
         8rukLacclLJExhZU6jIb4bdDCz7Al+7eW2gx7w5KQNsJQgzYFCNmCrmUIYmjGFdRPV4x
         diXQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="eV6/zAHs";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id z4si526727lfe.4.2019.10.12.02.41.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Oct 2019 02:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MNLS1-1iPWMR3eEj-006wOL; Sat, 12
 Oct 2019 11:41:50 +0200
Subject: Re: [PATCH 2/3] configs: Add SMC SiP IDs needed for Petalinux.
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: jailhouse-dev@googlegroups.com
References: <C4A932C2-5761-4E9D-A455-988C33A9F8F3@gmx.de>
 <9e1fd041-8152-9c4d-c8e4-2914a1adab1c@siemens.com>
 <A5DDA02F-7F4C-48F3-B28C-C31009AE8297@gmx.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8a18a3e7-7cde-020a-d40b-ddf0f5d07449@web.de>
Date: Sat, 12 Oct 2019 11:41:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <A5DDA02F-7F4C-48F3-B28C-C31009AE8297@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:23zectPLDc7MLSjjEamSdGFgsdkAHtf/EgigAMUCHEop7i7ERaF
 tqith3JbGdwbxuKnXjwVm/4BqLBTeio6NR1pzWDgxrKnQWn3PNuKzQPFA6WhgTaFkdnHwDT
 vGnNLJAr3WZRy8t7oaRlS6kpddySxaS5nzv8jqJivn++tplnkmumTKpqtCcskmL9d7HJKXQ
 eKZ5H/AgjfEK7fbbbLwQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D/DEh+ByEOg=:RTXRcl0l3m2uZ4t6E3p55v
 VkD8G/G1xzYxtShz2uSyAk6iRWzaqy1VOLDYdiCb7YTUL+fSKprTq92Bj2cQXm3wPF1bpUcm6
 mD+z0WEkhf14+v9kkdyaY7zPdh0A0GPh5wasAYxEEVTQb9zkBg4TXnchP6HdRSyyykRyOthLJ
 8ZMvY32A2lgVzjgr5y8T4BMDSBw/ifFTpTSJhOa8Py2cSQmmPX11NCnWntIs8WuE8xTu7ZyA+
 uD+kRjhCSkoRnp8+H+Fow7dPT75771WVtIAcV4QU/qoqEuBhPuhYEqNw/o6XEGzKldUgyn0Ri
 ZkwTLHbkWJDLfORcvcBL4f08m1OHZFa3DdIE7elmAiOEsL3Lp0dVMymtNPoaPeexl7LziXAE4
 CnZIQiy31MRBncfyKktSqTOCGWFxN950kosNEpsyTo7wo0f6b2FFJe9x8wLp7UWY8c4lIvhl5
 BnxfbQCNP0R5Qzk5roiGbU4J08RYl09QwQKBzg0h/q+FFUfpnMMZba2BhaAgwW8gup5x9ONZs
 NuHdlV2LN6SoTglxgHcFeRd3ePVmbE/zkjNta1L8ye67SHmg61wNapgbGoKas+8DsrTMibO10
 eK8IT42+L5oaT11TldK94WGADka3uK+JAXF4SjZVbsR+4639hykdj27a6cTGfCs5xPMqwLN2w
 +Cg/YlG5FFUwHmcCZGxp1TzIJvYUr4Vdq2D8eR2eQ+sCgfJfzuawwy1EOqUy4rfOudUWnXfeO
 j732EnDJJ3PgZpkN8dbdoTte6vaNOrraQGYmJKCPgiUiKuCnXi+xM/eSDvToUEA4qF3FAxOjM
 HCTkFAyXQKYFCrLYWYJ/eA6qMn5IGvdRG9F7xykXe73rLoLGgLcy7kVQEdbcVaVbuW+oCGqRA
 KF1sP8Esok487yPXI9HodvFDhL+ElH4DpUk/jSO8T3W3hayaN7x6SzK+zXeEYltjujQov0AoH
 VcEz8zETaT9a8vQWz266k7Zd2BryFTjcljtFYbZjpTFMjNu7NFBrKaVi4fcwQ+Vol0KOlCvd8
 29CgsscIiCA5u0XMVZqYfZtJq+irqOPME9lZfoupDcPtPGWJQwIFAnl+4gaZ/sN8CfDYM6zsK
 W79bIsDVDg3w2LkM72uUmaoGEcPJtQIjZSdURA0UlBnGCsmSSjxAPAbr0dpxZiL4pDo7cPW4G
 PTv7z8v8eEEZIDb3+Gnc4+EMm4BcdVu6cAfdCRhHQD+FZSSYemPMSdMNmKdP33gf/U3K6Obcr
 EyE8+bVgeb1B6S9rpTjQfxlBtTd3guNn0tAZMyOkG2KFEQyqnjddy2nxH5jE=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="eV6/zAHs";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 11.10.19 20:23, Oliver Schwartz wrote:
>
>
>> Am 11.10.2019 um 16:31 schrieb Jan Kiszka <jan.kiszka@siemens.com>:
>>
>> On 11.10.19 15:30, Oliver Schwartz wrote:
>>> This patch adds the SMC SiP IDs that are used by Petalinux to the root =
cell
>>> of zynqmp-zcu102.c. The SiP calls are:
>>> 0x0f: PM_SET_REQUIREMENT
>>> 0x24: PM_CLOCK_ENABLE
>>> 0x25: PM_CLOCK_DISABLE
>>
>> I suspect that this punches pretty large holes into the isolation. Don't=
 we rather need filtering on /which/ clocks a guest is allowed to control? =
Rather than allowing to power /all/ clocks or none?
>
> Maybe. I haven=E2=80=99t bothered yet, because in my case it=E2=80=99s on=
ly the root cell that is allowed to issue SMC calls. I agree that security-=
wise it=E2=80=99s more desirable to also filter by clock IDs. On the other =
hand it makes the configuration considerably more difficult, because you ne=
ed to synchronize devices in DTS and jailhouse configuration.
>
> So you=E2=80=99d make both the call ID and the clock ID a configuration p=
arameter?

We possibly need two things here:

1. ZynqMP-specific filtering of PM_CLOCK_* firmware calls on clock-level
2. ZynqMP-specific forwarding or emulation of PM_SET_REQUIREMENT
   firmware call

There is no point in generic per-ID SMC call filtering. We will likely
only be able to moderate few of those calls with a binary filter. As in
case of the clock calls, we will have to take their parameters into
account, i.e. interpret them. You pointed out the Xen approach for this
SoC, and that is pointing out what is needed. If not more.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8a18a3e7-7cde-020a-d40b-ddf0f5d07449%40web.de.
