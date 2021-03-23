Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRBG5N5CBAMGQE4V4QNTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DDA346505
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 17:26:04 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id o24sf1203889edt.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 09:26:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616516764; cv=pass;
        d=google.com; s=arc-20160816;
        b=pKo82RH57kJpNXKCT/dpJxSziShCbVOavi60LGzbiu1dAuqakGVtyS9O+6efaBhwJ7
         5VJzq2EgFoPj2WB3vFn9du9+7XSq5sAT3p3eWP2h7XCaOldjgt128tIpDlguQgzi0vo5
         3xwnceWiQfm+bAhRBmGL6zB0BgM79evIPGVeSwg3Kk+i16qjKbkSl1w4Hx+2hv4/dwQx
         z2H/xfXeyqVPuoZEK+sQJmcSoalkef7sISE6RN7N/ehFkKeEUXpYVyiYzdFisNly+Mlb
         lH6WBl8RmlLXLR8yU6DimxLd1bH/D3kAqce0/IphjOZzFM8uc8eenRR8fl9klgO+dE3J
         w58w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=y8JtrSVsNHKMudhhEn6HGb0jl1ezJwhxvEwJKJeifCU=;
        b=sJl/i94iCFlHqJ36c3B3uW0HdyAJ5WoYIz/a6j+ux70Sae6ZVsXN8e2JGr3SJzm7DM
         m1v+pRPR0cg56zdtKlWlTnhCOX5G5iBdAAXpQzF2GKTReXV9IRvxB5RvnScpaTSEa+y3
         MqSgamAj55Xqa7yv44uRbeP6JhMElAuJ4n9CErwOGZeW9odAxqA7d5D0jYP3TH5C8brH
         eSR7hFOtCr6VC+9W/NbI+QTOQTmbfiwqddMNg0KtXzHVD4l5/7bXg9eVFVT44jWgXWnB
         si8G6yz8tn2li/xJfi5PUYg0YcHMrmzYgSo8HDLJUoEdKPk8PMaWmwCjiXqCaNedtZmL
         swvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y9LESqAO;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::532 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y8JtrSVsNHKMudhhEn6HGb0jl1ezJwhxvEwJKJeifCU=;
        b=DKWs6nQqVEu6WH75xG/ISdDiFS9tGANB4lrD5LBZoWidc+A0t3qqpaf1nqCfH5Gx7P
         cRXWW7TVZ9uRty1Uy621DoT7/YqQJGknB+vUWKKyjef9J60EeIH70FanmrUQ14IJsIA0
         BCrEjBZqtmGRMihnVXv6mJg+agsKfUrC1nWueZQQcklLzuQRf+rEMsKgFFsHF+R9oaG4
         /pqP0NvjfpX9BbOmty2OQnBTfmNIufXT16AC4fnky3+EhhY/eDgh6atGRFUlsllfKnxU
         iKTgwV6N+m6J7evY20KLNvkpV9umf19wIzdKzfYMCTORdVbhhe/jEglw69NAhxe4QqWo
         WTsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y8JtrSVsNHKMudhhEn6HGb0jl1ezJwhxvEwJKJeifCU=;
        b=qIldSBw9uJWXxp/ki3xQ3XVnAMEgcHL2sqKXuYHRc3+mxZCYJn775y+a4hgHuPPh5f
         n34cTxdcFk14bvFtEHmP583+taW0AUoV2QEoTBmtW9GFoeJMfso7CVfhoCicmiWF3DKo
         884ypmxYiAE23SwuHzy2qwYl6atwZus/pGwQXrSE4b0J7+en5GI+bqgJfvPAuI8Gg6uN
         wmSnqfskN1Kg1nhN83vR3uo2aZ8YXtvYoCRV6D+d4xSkb0f8JGCQC0fBDdxMzNxJNbYo
         9XR5/GAhKYngmo+NQeKus7hfFoNY2ouQj2lu02QvkZ5NmggS9EEViEjYVJ72VG5q6xW2
         z05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y8JtrSVsNHKMudhhEn6HGb0jl1ezJwhxvEwJKJeifCU=;
        b=WGjrYNQXQAKYODM1i1V9uvMdtP1yLDIybNTpU75EQwnV/5lGiblBjrGgcwJ2P0dkLG
         WnGpe88eO0zA9TalUS4bj8JEGD0LlCpfDQbBdE5POr56VVk3zKUPbAulCAEkkwpvJYfG
         GjJ9rCdXx9mU6QTJlA7ruS5BjduN0RqO0Mjx0znN7TaOBix5TmxoAzd151/haoQcfCVp
         axT/gQ8EnfMx4IVEbuUFgvF+SStljnEtlnSBpZWBNwJ6+/J+6OLLEBRiybCrbnj/TJ9C
         ERiQzV7xRSusi/I9sM3bV1z/PwHZbIh9VJp2utpcAlxyceXmgXQ3FpUAKDIfiMuhlcf6
         grIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530cWD9pFNbMQ3321aF2IeilqttsnIHoZVxHUb9kMCEvrtPVmVJa
	jGsCJFhvwDA8Q8OR+tntZsw=
X-Google-Smtp-Source: ABdhPJx+a+WPCy4Z2o8ukbOl8uGNnl5kXkGuPViysOsLVweRpkACIDLTq32jddWLqYm+gODqZEvtdQ==
X-Received: by 2002:a05:6402:12cf:: with SMTP id k15mr5260071edx.192.1616516764114;
        Tue, 23 Mar 2021 09:26:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:3f15:: with SMTP id hq21ls9284645ejc.9.gmail; Tue,
 23 Mar 2021 09:26:03 -0700 (PDT)
X-Received: by 2002:a17:906:81c9:: with SMTP id e9mr5635605ejx.456.1616516762987;
        Tue, 23 Mar 2021 09:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616516762; cv=none;
        d=google.com; s=arc-20160816;
        b=Bqs+A9tJjI7f8nYDBACJWJzJwQzMJz/lSbqZcePYGX6O0yEb/V1JNnvHubKj5F8FOL
         cYxCCO9isXQCCu8NwbUAxGg03wSis/OFl/ncS7H582ZMDSk9kedPKYgANMlefIUxQN2e
         37R1/Dv81CeMejcLrncxLWKLYoHkZ/S6KTgbkvvcnpzIlz35GCfenMM3jvu8LKM7JV8X
         dIahzMxGlmpM0bwROL+D02umNbEiGV8AxjjgsIwaHMUoVL1+nEbaRTfK9bXfEqSR+nWY
         Ep3BYQtJXI0wWsfJCDi+q580BB4swl44uItXo2l8FG6YLFOEHoqBcIgKBilsf23hSv5/
         UPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=4iO0wO+nnFVPr1uBB5zIxPHGt1sU2VxBwnSN1Zz9okw=;
        b=DPC4gqLLRcho5bcHE4xzvOqtHadJ2s3+46mP/yG8HdyBS7542CFda6BurY6ECqUOi0
         qWky/c89ixXh1YKwHSTMel2y8piqpeWhnThKmBgiLm8nSmoWCF24E17wMxVP9/Bk7VdK
         u7SkEsdxs60ceHQAP9JyTS7Z3xaUOC4IqAX5ZsWlTC8/tPyZxuCHwjMs6Y5+2uf18E+m
         yYaJZ9jAPl3KHF7yVjJkAS0h17HVH7sN/+xXihsa/xmmWSXTfFtyS8OL6U4PRpkILdsf
         VL31xJSbf9VxDELfUOzVOJZYFwY6yFFqpgkxiCDJhhcmIXWb4EeapIdwlOFGWs7e2Eu+
         2ubQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y9LESqAO;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::532 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com. [2a00:1450:4864:20::532])
        by gmr-mx.google.com with ESMTPS id c2si534986edr.2.2021.03.23.09.26.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 09:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::532 as permitted sender) client-ip=2a00:1450:4864:20::532;
Received: by mail-ed1-x532.google.com with SMTP id bx7so24138635edb.12
        for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 09:26:02 -0700 (PDT)
X-Received: by 2002:a05:6402:c1:: with SMTP id i1mr5290172edu.315.1616516762710;
 Tue, 23 Mar 2021 09:26:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:2d8b:0:0:0:0 with HTTP; Tue, 23 Mar 2021 09:26:01
 -0700 (PDT)
In-Reply-To: <90b4e3c5-4841-0699-7601-f455e569c84b@siemens.com>
References: <CADiTV-03GyURVJ2De-Fe5reAcvveWQq7JxAUTh2kES2DSbwcWA@mail.gmail.com>
 <23971adf-097b-073d-b31a-9de1a333fbbf@siemens.com> <CADiTV-1tnpfVYjnmvuvG7Tz6q-+dMZ3PdKxjqBonyFatWh3irA@mail.gmail.com>
 <f88cc779-00a7-dbc5-19b7-c4ba9921d5a6@siemens.com> <CADiTV-1AsxjptpR4q4rbEhZnkpOjJiAxo_omnNX_QHZZRnyakw@mail.gmail.com>
 <90b4e3c5-4841-0699-7601-f455e569c84b@siemens.com>
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Tue, 23 Mar 2021 17:26:01 +0100
Message-ID: <CADiTV-2pfQ4SVayR2A_3+ogF7T743RjM+W7R0hQFNu=NG5c5wA@mail.gmail.com>
Subject: Re: Arm zero exits and zynqmp ATF SDEI-enabling patch upstreaming
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Marco Solieri <marco.solieri@unimore.it>
Content-Type: multipart/mixed; boundary="0000000000006a63e905be36a3bc"
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Y9LESqAO;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::532 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
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

--0000000000006a63e905be36a3bc
Content-Type: text/plain; charset="UTF-8"

On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 23.03.21 16:36, Angelo Ruocco wrote:
>> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>> On 23.03.21 12:33, Angelo Ruocco wrote:
>>>> On 23/03/2021, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>> On 23.03.21 11:17, Angelo Ruocco wrote:
>>>>>> Hi Jan, all,
>>>>>>
>>>>>> I have seen that arm-zero-exits has been merged into next.
>>>>>>
>>>>>> My understanding is that right now the only officially supported
>>>>>> boards, meaning supporting both jailhouse and SDEI, are NXP's ones,
>>>>>> with only a experimental patch for the xilinx zynqmp firmware to
>>>>>> enable SDEI.
>>>>>>
>>>>>> Regarding that patch, I have looked at it, tested it and added the
>>>>>> missing non-secure-boundary check.
>>>>>>
>>>>>> Are you thinking of submitting it upstream? If so, how do you want to
>>>>>> proceed?
>>>>>
>>>>> If you have everything ready with the patch, I would not mind if you
>>>>> pushed that upstream. Just CC me.
>>>>
>>>> The only thing missing is a proper commit message, I could also write
>>>> that, but I don't really know whether it's appropriate for me to
>>>> submit a patch of which I don't have the authorship. What do you
>>>> think?
>>>
>>> But you added something to it as you wrote above, no?
>>
>> Yes, but that's hardly worth adding my signature to the patch, not to
>> mention authorship.
>>
>>> Otherwise, share what you have, and I will kick off the gerrit mess.
>>
>> That is ok by me. How do you want me to send the patch? Here in the
>> mailing list?
>>
>
> Yes, just drop it here, attached or inline.
>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>


You'll find the patch attached.

Thanks,
Angelo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-2pfQ4SVayR2A_3%2BogF7T743RjM%2BW7R0hQFNu%3DNG5c5wA%40mail.gmail.com.

--0000000000006a63e905be36a3bc
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-zynqmp-Add-SDEI-support.patch"
Content-Disposition: attachment; 
	filename="0001-zynqmp-Add-SDEI-support.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

RnJvbSBlN2FiY2E0ZWYyNzA1NzMwMjNlYjA3MmQzNjhlMjAzYzY5MzM1NjNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYW4gS2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMuY29tPgpE
YXRlOiBUdWUsIDE0IEp1bCAyMDIwIDIyOjM2OjU5ICswMjAwClN1YmplY3Q6IFtQQVRDSF0genlu
cW1wOiBBZGQgU0RFSSBzdXBwb3J0CgpTaWduZWQtb2ZmLWJ5OiBKYW4gS2lzemthIDxqYW4ua2lz
emthQHNpZW1lbnMuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmdlbG8gUnVvY2NvIDxhbmdlbG9ydW9j
Y285MEBnbWFpbC5jb20+Ci0tLQogcGxhdC94aWxpbngvenlucW1wL2luY2x1ZGUvcGxhdGZvcm1f
ZGVmLmggfCAyNyArKysrKysrKysrLS0tLQogcGxhdC94aWxpbngvenlucW1wL3BsYXRmb3JtLm1r
ICAgICAgICAgICAgfCAgNSArKysKIHBsYXQveGlsaW54L3p5bnFtcC96eW5xbXBfZWhmLmMgICAg
ICAgICAgIHwgMjYgKysrKysrKysrKysrKysKIHBsYXQveGlsaW54L3p5bnFtcC96eW5xbXBfc2Rl
aS5jICAgICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdl
ZCwgOTQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
bGF0L3hpbGlueC96eW5xbXAvenlucW1wX2VoZi5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGxhdC94
aWxpbngvenlucW1wL3p5bnFtcF9zZGVpLmMKCmRpZmYgLS1naXQgYS9wbGF0L3hpbGlueC96eW5x
bXAvaW5jbHVkZS9wbGF0Zm9ybV9kZWYuaCBiL3BsYXQveGlsaW54L3p5bnFtcC9pbmNsdWRlL3Bs
YXRmb3JtX2RlZi5oCmluZGV4IDI3OTY4NDA5ZS4uYWQ2NWU5NTM5IDEwMDY0NAotLS0gYS9wbGF0
L3hpbGlueC96eW5xbXAvaW5jbHVkZS9wbGF0Zm9ybV9kZWYuaAorKysgYi9wbGF0L3hpbGlueC96
eW5xbXAvaW5jbHVkZS9wbGF0Zm9ybV9kZWYuaApAQCAtMzYsOCArMzYsOCBAQAogICogbGl0dGxl
IHNwYWNlIGZvciBncm93dGguCiAgKi8KICNpZm5kZWYgWllOUU1QX0FURl9NRU1fQkFTRQotI2lm
ICFERUJVRyAmJiBkZWZpbmVkKFNQRF9ub25lKQotIyBkZWZpbmUgQkwzMV9CQVNFCQkJMHhmZmZl
YTAwMAorI2lmICFERUJVRyAmJiBkZWZpbmVkKFNQRF9ub25lKSAmJiAhZGVmaW5lZChTREVJX1NV
UFBPUlQpCisjIGRlZmluZSBCTDMxX0JBU0UJCQkweGZmZmU3MDAwCiAjIGRlZmluZSBCTDMxX0xJ
TUlUCQkJMHhmZmZmZmZmZgogI2Vsc2UKICMgZGVmaW5lIEJMMzFfQkFTRQkJCTB4MTAwMApAQCAt
OTEsNiArOTEsMjEgQEAKICNkZWZpbmUgQ0FDSEVfV1JJVEVCQUNLX1NISUZUICAgNgogI2RlZmlu
ZSBDQUNIRV9XUklURUJBQ0tfR1JBTlVMRSAoMSA8PCBDQUNIRV9XUklURUJBQ0tfU0hJRlQpCiAK
Ky8qIFBsYXRmb3JtIG1hY3JvcyB0byBzdXBwb3J0IGV4Y2VwdGlvbiBoYW5kbGluZyBmcmFtZXdv
cmsgKi8KKyNkZWZpbmUgUExBVF9QUklfQklUUwkJCVUoMykKKyNkZWZpbmUgUExBVF9TREVJX0NS
SVRJQ0FMX1BSSQkJMHgxMAorI2RlZmluZSBQTEFUX1NERUlfTk9STUFMX1BSSQkJMHgyMAorCisv
KiBTREVJIGR5bmFtaWMgcHJpdmF0ZSBldmVudCBudW1iZXJzICovCisjZGVmaW5lIFpZTlFNUF9T
REVJX0RQX0VWRU5UXzAJCVUoMTAwKQorI2RlZmluZSBaWU5RTVBfU0RFSV9EUF9FVkVOVF8xCQlV
KDEwMSkKKyNkZWZpbmUgWllOUU1QX1NERUlfRFBfRVZFTlRfMgkJVSgxMDIpCisKKy8qIFNERUkg
ZHluYW1pYyBzaGFyZWQgZXZlbnQgbnVtYmVycyAqLworI2RlZmluZSBaWU5RTVBfU0RFSV9EU19F
VkVOVF8wCQlVKDIwMCkKKyNkZWZpbmUgWllOUU1QX1NERUlfRFNfRVZFTlRfMQkJVSgyMDEpCisj
ZGVmaW5lIFpZTlFNUF9TREVJX0RTX0VWRU5UXzIJCVUoMjAyKQorCiAjZGVmaW5lIFBMQVRfQVJN
X0dJQ0RfQkFTRQlCQVNFX0dJQ0RfQkFTRQogI2RlZmluZSBQTEFUX0FSTV9HSUNDX0JBU0UJQkFT
RV9HSUNDX0JBU0UKIC8qCkBAIC0xMDIsOCArMTE3LDYgQEAKICNkZWZpbmUgUExBVF9BUk1fRzFT
X0lSUV9QUk9QUyhncnApIFwKIAlJTlRSX1BST1BfREVTQyhBUk1fSVJRX1NFQ19QSFlfVElNRVIs
IEdJQ19ISUdIRVNUX1NFQ19QUklPUklUWSwgZ3JwLCBcCiAJCQlHSUNfSU5UUl9DRkdfTEVWRUwp
LCBcCi0JSU5UUl9QUk9QX0RFU0MoQVJNX0lSUV9TRUNfU0dJXzAsIEdJQ19ISUdIRVNUX1NFQ19Q
UklPUklUWSwgZ3JwLCBcCi0JCQlHSUNfSU5UUl9DRkdfRURHRSksIFwKIAlJTlRSX1BST1BfREVT
QyhBUk1fSVJRX1NFQ19TR0lfMSwgR0lDX0hJR0hFU1RfU0VDX1BSSU9SSVRZLCBncnAsIFwKIAkJ
CUdJQ19JTlRSX0NGR19FREdFKSwgXAogCUlOVFJfUFJPUF9ERVNDKEFSTV9JUlFfU0VDX1NHSV8y
LCBHSUNfSElHSEVTVF9TRUNfUFJJT1JJVFksIGdycCwgXApAQCAtMTI0LDggKzEzNyw2IEBACiAJ
CQlHSUNfSU5UUl9DRkdfTEVWRUwpLCBcCiAJSU5UUl9QUk9QX0RFU0MoSVJRX1RUQzNfMSwgR0lD
X0hJR0hFU1RfU0VDX1BSSU9SSVRZLCBncnAsIFwKIAkJCUdJQ19JTlRSX0NGR19FREdFKSwgXAot
CUlOVFJfUFJPUF9ERVNDKEFSTV9JUlFfU0VDX1NHSV8wLCBHSUNfSElHSEVTVF9TRUNfUFJJT1JJ
VFksIGdycCwgXAotCQkJR0lDX0lOVFJfQ0ZHX0VER0UpLCBcCiAJSU5UUl9QUk9QX0RFU0MoQVJN
X0lSUV9TRUNfU0dJXzEsIEdJQ19ISUdIRVNUX1NFQ19QUklPUklUWSwgZ3JwLCBcCiAJCQlHSUNf
SU5UUl9DRkdfRURHRSksIFwKIAlJTlRSX1BST1BfREVTQyhBUk1fSVJRX1NFQ19TR0lfMiwgR0lD
X0hJR0hFU1RfU0VDX1BSSU9SSVRZLCBncnAsIFwKQEAgLTE0Miw2ICsxNTMsOCBAQAogCQkJR0lD
X0lOVFJfQ0ZHX0VER0UpCiAjZW5kaWYKIAotI2RlZmluZSBQTEFUX0FSTV9HMF9JUlFfUFJPUFMo
Z3JwKQorI2RlZmluZSBQTEFUX0FSTV9HMF9JUlFfUFJPUFMoZ3JwKSBcCisJSU5UUl9QUk9QX0RF
U0MoQVJNX0lSUV9TRUNfU0dJXzAsIFBMQVRfU0RFSV9OT1JNQUxfUFJJLAlncnAsIFwKKwkJCUdJ
Q19JTlRSX0NGR19FREdFKQogCiAjZW5kaWYgLyogUExBVEZPUk1fREVGX0ggKi8KZGlmZiAtLWdp
dCBhL3BsYXQveGlsaW54L3p5bnFtcC9wbGF0Zm9ybS5tayBiL3BsYXQveGlsaW54L3p5bnFtcC9w
bGF0Zm9ybS5tawppbmRleCA2ZTcwMGI5YjEuLjBkMDc0NTIyNiAxMDA2NDQKLS0tIGEvcGxhdC94
aWxpbngvenlucW1wL3BsYXRmb3JtLm1rCisrKyBiL3BsYXQveGlsaW54L3p5bnFtcC9wbGF0Zm9y
bS5tawpAQCAtMTQsNiArMTQsOSBAQCBvdmVycmlkZSBSRVNFVF9UT19CTDMxIDo9IDEKIG92ZXJy
aWRlIEdJQ1YyX0cwX0ZPUl9FTDMgOj0gMQogb3ZlcnJpZGUgV0FSTUJPT1RfRU5BQkxFX0RDQUNI
RV9FQVJMWSA6PSAxCiAKK0VMM19FWENFUFRJT05fSEFORExJTkcgOj0gMQorU0RFSV9TVVBQT1JU
IDo9IDEKKwogIyBEbyBub3QgZW5hYmxlIFNWRQogRU5BQkxFX1NWRV9GT1JfTlMJOj0gMAogCkBA
IC05MCw2ICs5Myw4IEBAIEJMMzFfU09VUkNFUwkJKz0JZHJpdmVycy9hcm0vY2NpL2NjaS5jCQkJ
CVwKIAkJCQlwbGF0L3hpbGlueC96eW5xbXAvcGxhdF96eW5xbXAuYwkJXAogCQkJCXBsYXQveGls
aW54L3p5bnFtcC9wbGF0X3RvcG9sb2d5LmMJCVwKIAkJCQlwbGF0L3hpbGlueC96eW5xbXAvc2lw
X3N2Y19zZXR1cC5jCQlcCisJCQkJcGxhdC94aWxpbngvenlucW1wL3p5bnFtcF9laGYuYwkJCVwK
KwkJCQlwbGF0L3hpbGlueC96eW5xbXAvenlucW1wX3NkZWkuYwkJXAogCQkJCXBsYXQveGlsaW54
L3p5bnFtcC9wbV9zZXJ2aWNlL3BtX3N2Y19tYWluLmMJXAogCQkJCXBsYXQveGlsaW54L3p5bnFt
cC9wbV9zZXJ2aWNlL3BtX2FwaV9zeXMuYwlcCiAJCQkJcGxhdC94aWxpbngvenlucW1wL3BtX3Nl
cnZpY2UvcG1fYXBpX3BpbmN0cmwuYwlcCmRpZmYgLS1naXQgYS9wbGF0L3hpbGlueC96eW5xbXAv
enlucW1wX2VoZi5jIGIvcGxhdC94aWxpbngvenlucW1wL3p5bnFtcF9laGYuYwpuZXcgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLmNjZTAxZTVjZAotLS0gL2Rldi9udWxsCisrKyBi
L3BsYXQveGlsaW54L3p5bnFtcC96eW5xbXBfZWhmLmMKQEAgLTAsMCArMSwyNiBAQAorLyoKKyAq
IENvcHlyaWdodCAoYykgMjAxNy0yMDE5LCBBUk0gTGltaXRlZCBhbmQgQ29udHJpYnV0b3JzLiBB
bGwgcmlnaHRzIHJlc2VydmVkLgorICogQ29weXJpZ2h0IChjKSBTaWVtZW5zIEFHLCAyMDIwCisg
KgorICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0zLUNsYXVzZQorICovCisKKyNpbmNs
dWRlIDxwbGF0Zm9ybV9kZWYuaD4KKworI2luY2x1ZGUgPGJsMzEvZWhmLmg+CisKKy8qCisgKiBF
bnVtZXJhdGlvbiBvZiBwcmlvcml0eSBsZXZlbHMgb24gQVJNIHBsYXRmb3Jtcy4KKyAqLworZWhm
X3ByaV9kZXNjX3QgenlucW1wX2V4Y2VwdGlvbnNbXSA9IHsKKyNpZiBTREVJX1NVUFBPUlQKKwkv
KiBDcml0aWNhbCBwcmlvcml0eSBTREVJICovCisJRUhGX1BSSV9ERVNDKFBMQVRfUFJJX0JJVFMs
IFBMQVRfU0RFSV9DUklUSUNBTF9QUkkpLAorCisJLyogTm9ybWFsIHByaW9yaXR5IFNERUkgKi8K
KwlFSEZfUFJJX0RFU0MoUExBVF9QUklfQklUUywgUExBVF9TREVJX05PUk1BTF9QUkkpLAorI2Vu
ZGlmCit9OworCisvKiBQbHVnIGluIEFSTSBleGNlcHRpb25zIHRvIEV4Y2VwdGlvbiBIYW5kbGlu
ZyBGcmFtZXdvcmsuICovCitFSEZfUkVHSVNURVJfUFJJT1JJVElFUyh6eW5xbXBfZXhjZXB0aW9u
cywgQVJSQVlfU0laRSh6eW5xbXBfZXhjZXB0aW9ucyksIFBMQVRfUFJJX0JJVFMpOwpkaWZmIC0t
Z2l0IGEvcGxhdC94aWxpbngvenlucW1wL3p5bnFtcF9zZGVpLmMgYi9wbGF0L3hpbGlueC96eW5x
bXAvenlucW1wX3NkZWkuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAuLjI3
NTM0OTZhMAotLS0gL2Rldi9udWxsCisrKyBiL3BsYXQveGlsaW54L3p5bnFtcC96eW5xbXBfc2Rl
aS5jCkBAIC0wLDAgKzEsNDMgQEAKKy8qCisgKiBDb3B5cmlnaHQgKGMpIDIwMTctMjAyMCwgQVJN
IExpbWl0ZWQgYW5kIENvbnRyaWJ1dG9ycy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyAqIENvcHly
aWdodCAoYykgU2llbWVucyBBRywgMjAyMAorICoKKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBCU0QtMy1DbGF1c2UKKyAqLworCisvKiBTREVJIGNvbmZpZ3VyYXRpb24gZm9yIEFSTSBwbGF0
Zm9ybXMgKi8KKworI2luY2x1ZGUgPGJsMzEvZWhmLmg+CisjaW5jbHVkZSA8Y29tbW9uL2RlYnVn
Lmg+CisjaW5jbHVkZSA8c2VydmljZXMvc2RlaS5oPgorCisjaW5jbHVkZSA8cGxhdC9jb21tb24v
cGxhdGZvcm0uaD4KKyNpbmNsdWRlIDxwbGF0Zm9ybV9kZWYuaD4KKworaW50IGFybV92YWxpZGF0
ZV9uc19lbnRyeXBvaW50KHVpbnRwdHJfdCBlbnRyeXBvaW50KQoreworCXJldHVybiAoZW50cnlw
b2ludCA8IEJMMzFfQkFTRSkgfHwgKGVudHJ5cG9pbnQgPiBCTDMxX0xJTUlUKSA/IDAgOiAtMTsK
K30KKworLyogUHJpdmF0ZSBldmVudCBtYXBwaW5ncyAqLworc3RhdGljIHNkZWlfZXZfbWFwX3Qg
enlucW1wX3NkZWlfcHJpdmF0ZVtdID0geworCVNERUlfREVGSU5FX0VWRU5UXzAoOCksCisJU0RF
SV9QUklWQVRFX0VWRU5UKFpZTlFNUF9TREVJX0RQX0VWRU5UXzAsIFNERUlfRFlOX0lSUSwgU0RF
SV9NQVBGX0RZTkFNSUMpLAorCVNERUlfUFJJVkFURV9FVkVOVChaWU5RTVBfU0RFSV9EUF9FVkVO
VF8xLCBTREVJX0RZTl9JUlEsIFNERUlfTUFQRl9EWU5BTUlDKSwKKwlTREVJX1BSSVZBVEVfRVZF
TlQoWllOUU1QX1NERUlfRFBfRVZFTlRfMiwgU0RFSV9EWU5fSVJRLCBTREVJX01BUEZfRFlOQU1J
QyksCit9OworCisvKiBTaGFyZWQgZXZlbnQgbWFwcGluZ3MgKi8KK3N0YXRpYyBzZGVpX2V2X21h
cF90IHp5bnFtcF9zZGVpX3NoYXJlZFtdID0geworCVNERUlfU0hBUkVEX0VWRU5UKFpZTlFNUF9T
REVJX0RTX0VWRU5UXzAsIFNERUlfRFlOX0lSUSwgU0RFSV9NQVBGX0RZTkFNSUMpLAorCVNERUlf
U0hBUkVEX0VWRU5UKFpZTlFNUF9TREVJX0RTX0VWRU5UXzEsIFNERUlfRFlOX0lSUSwgU0RFSV9N
QVBGX0RZTkFNSUMpLAorCVNERUlfU0hBUkVEX0VWRU5UKFpZTlFNUF9TREVJX0RTX0VWRU5UXzIs
IFNERUlfRFlOX0lSUSwgU0RFSV9NQVBGX0RZTkFNSUMpLAorfTsKKwordm9pZCBwbGF0X3NkZWlf
c2V0dXAodm9pZCkKK3sKKwlJTkZPKCJTREVJIHBsYXRmb3JtIHNldHVwXG4iKTsKK30KKworLyog
RXhwb3J0IEFSTSBTREVJIGV2ZW50cyAqLworUkVHSVNURVJfU0RFSV9NQVAoenlucW1wX3NkZWlf
cHJpdmF0ZSwgenlucW1wX3NkZWlfc2hhcmVkKTsKLS0gCjIuMTcuMQoK
--0000000000006a63e905be36a3bc--
