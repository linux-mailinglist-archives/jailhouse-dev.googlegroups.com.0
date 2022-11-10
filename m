Return-Path: <jailhouse-dev+bncBDB3VRMVXIPRBUWDWSNQMGQE7UQRHAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B8A624695
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 17:07:48 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id s1-20020a197701000000b004a2aebd8b14sf716038lfc.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Nov 2022 08:07:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1668096467; cv=pass;
        d=google.com; s=arc-20160816;
        b=0jih4bsJ+97BYq9YKnDk6sCWo6wYbP8KYnFO3KcKw058luJv9VYYGjfRKFxi0DQ3OK
         MMljTgpWQg2JYmsJHe8V9SUHOTR5fwlyEm5afbmZHLarMhh1NTzIYL6Qk87ZFfok1mt9
         BWHty9f6ZTMZZiojY9z8XJnGjHfwpRier69Kj3pMh7DJEdVO6Z18H8fxwSfmKTukAi77
         P0D6DvsNTmLsWfb5Hb8FQLRVjIe0Xa2xDWbKlpJAdrFYsioq87OQsXg7ot1Xnc1o+9Og
         XFxmtSSChVZNCGFg9uhAwUz33zFIufrN4A0otxWEcbkcxYTSKbp5XGkMCsPuNsEVBL1b
         IN4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=EwKXUosNicDLTWEqI++f8mNcsTqTV7BzzeQRWmMJVMM=;
        b=UNxqWOH6V8iWh5m9g/Tn/cup6KoydHLREq9Rwow2o0g5Tj2StGPChaYux68F5QFnLf
         n9n6ueCy16f5zS000fSCYWzgCW81qDkH/4UutbUTKRc8j4zhId1sBqgQkc9aUkpfR5ck
         8LoBCEmJTr6dkG2kqQLOXR4T+B+/60YfIlWv/xeVeSR9Wj91hZSjicPIPJcomta4ikUg
         FJKeK7qi+c5U8t4LdGWuTnpAJa+Ftp5HHxB8eqTquBsLXVpjOyG3DJmf0Ke0Zjhc+H6p
         41xWs7JJ0fmN7w5y1p/pnSI+Ya65t4g2QEGyGw4341Rk1Wu0X93tIugcA9VWKvAwu1GV
         4xYg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@suse.com header.s=susede1 header.b=nuCNQXMw;
       spf=pass (google.com: domain of jgross@suse.com designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=jgross@suse.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=suse.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwKXUosNicDLTWEqI++f8mNcsTqTV7BzzeQRWmMJVMM=;
        b=l6E47Ju9tSNVEsJwgGNQ/nueXi4aEejClBthVd2jBiFt3GgGshkaia4CUhNmxXfuuX
         R1mXtKu2QZpmviiC0I46D7Sc1ZECuYl097+0Di4HX21v24Zl3EHfXZfmJsCzg/gMScUD
         dklcCbFubKtHNAnaxOjEPnwBOTYBjGABkgLKe7p3aEMACZom8LoCZon+aowRF+dfIlev
         UqKB4Dhivp8xzC4h7hE1KbeiRS4jZv4hbovqS+t2bV+nx6qP89bvCh1v45OiCXLMIH/R
         tD2R9udbCDWGtkr2967IyxFBU2827YTNtIFxfer3TupEwc1QwHWRkP1bgmsZ3hskV+on
         dtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EwKXUosNicDLTWEqI++f8mNcsTqTV7BzzeQRWmMJVMM=;
        b=PYX+AqUlkucAJzyzeRFe/6DERD51QYoarBwiMALi9iQ8taglkxs+UpH9N/SClqQ1gt
         xZHM/uHjDcVmSvYOAsZzgc1QP+kDeInAXspEas4UrUPGqJsQoN8rnfcpy+lxt6RLQihf
         Z6lcfzyLCSAGDmRfFfPVq46vMJ3hGqOXcKuiavfcXa/cLQGIyaya9bwjWR+AcytdejsV
         aBvSDPclyxKSNFDzkAz6jFZmnKRkh7FS72PztNIMFNAnPxVo7nYDLiOSibHpl4QPH0Q8
         kN7yE7/9bC8dm54JRDYbv15p1ADtVATHY29XkcUWO/aI75a1Ugb9790TVftzMk6PFs+O
         rHFQ==
X-Gm-Message-State: ACrzQf356BHkEoiTDANq8dQb2Kjczph9HDrhVs3PzjAgm5BfD4SuMM77
	29FF2yuM72vwbMHvYutmy6c=
X-Google-Smtp-Source: AMsMyM78WB8d6FzT7tnT+6KXgYKnfjtU9ZiUIffuytmkwpzEn+a5wzmUK8lWGV0TpeoyZ0akYMV0tw==
X-Received: by 2002:ac2:4bc9:0:b0:4aa:66d3:c717 with SMTP id o9-20020ac24bc9000000b004aa66d3c717mr24843115lfq.73.1668096467626;
        Thu, 10 Nov 2022 08:07:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:5d5:b0:48b:2227:7787 with SMTP id
 o21-20020a05651205d500b0048b22277787ls452673lfo.3.-pod-prod-gmail; Thu, 10
 Nov 2022 08:07:46 -0800 (PST)
X-Received: by 2002:a05:6512:acf:b0:4ac:d6e4:41d4 with SMTP id n15-20020a0565120acf00b004acd6e441d4mr1502351lfu.253.1668096465814;
        Thu, 10 Nov 2022 08:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668096465; cv=none;
        d=google.com; s=arc-20160816;
        b=XrOLPvmJb+N6v2uGEClMfy2HDLsrJbiZbxVsd+SQ1qP0trt0IDiB3/Tr1Lrhzcl3K3
         uujMa5GiudSU22p0DyubColM8ZkGKcKItDaqC1G2cIcC0Au38xeNXdp+BzurQJkisGnd
         lcoCL7qK+EffRNkMNPEpfCZ9G0asU2kQt7bbyDwFvc4hLMkZg7WQTOc9HQ2/PyTKA8Ig
         JXSZxYqmNq50JF3To1+T5smeDhJlj4r3C5mONxqjShbFLuhnB8tLp3EemP3X3dkp1hDs
         +UYMu+5lFAREZQGrHiSOp6BVcyyWz3UDsVW9icEPMMiR9J+Z7kB3rWsv0/gW0IHsLWcH
         9ezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EV/Fk1WylZ737nbacAp1wmPRQUJJLl/hYoCm6tBJc+g=;
        b=m47FgBG1DrCne2qnZ3MrlIA62Lmy9XnD0nd+7Oae5LHUdOFa/1Q32uS691uS+AkJiN
         qvtwfHHbMUZBBoONrnG0KWRgq/q6lkB+2gY5ROD5b8zIq7xPKZdw9Zu0XASQlOoWmhNU
         kxgU3ctIAF04xB3AW6pLSsZjIVA0idniL+NnkcMroaAMdnTNHWybFnpfXPscI6gCT+7l
         0jDIy7d1HrL/k8wTSg0fZ/ht6RIOHzpIEZ4KgblYA5G4ew5moFQAXonDsjeursLOhdda
         QS5Jws5TNZk848VZz/jOLIuSRlehbhY6cn/Vcn0TnEbVGecrSXoZB/K1YS1Bgr/DWElv
         RPKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@suse.com header.s=susede1 header.b=nuCNQXMw;
       spf=pass (google.com: domain of jgross@suse.com designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=jgross@suse.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=suse.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by gmr-mx.google.com with ESMTPS id z14-20020a056512370e00b0048b224551b6si600234lfr.12.2022.11.10.08.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:07:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jgross@suse.com designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 13E231FE12;
	Thu, 10 Nov 2022 16:07:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 996B01332F;
	Thu, 10 Nov 2022 16:07:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9TMgJNAhbWMSXgAAMHmgww
	(envelope-from <jgross@suse.com>); Thu, 10 Nov 2022 16:07:44 +0000
Message-ID: <66c5c5a8-7a8b-aefc-6466-c7d20236550e@suse.com>
Date: Thu, 10 Nov 2022 17:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
Content-Language: en-US
To: Ross Philipson <ross.philipson@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
 dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
 trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
 jan.kiszka@siemens.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
From: "'Juergen Gross' via Jailhouse" <jailhouse-dev@googlegroups.com>
In-Reply-To: <20221110154521.613472-2-ross.philipson@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mBxoMJgcAlsBu0oRWxNGGnrZ"
X-Original-Sender: jgross@suse.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@suse.com header.s=susede1 header.b=nuCNQXMw;       spf=pass
 (google.com: domain of jgross@suse.com designates 2001:67c:2178:6::1d as
 permitted sender) smtp.mailfrom=jgross@suse.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=suse.com
X-Original-From: Juergen Gross <jgross@suse.com>
Reply-To: Juergen Gross <jgross@suse.com>
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mBxoMJgcAlsBu0oRWxNGGnrZ
Content-Type: multipart/mixed; boundary="------------dd6c6hUQlWDPpqABWqQLDgwl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ross Philipson <ross.philipson@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
 dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
 trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
 jan.kiszka@siemens.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
Message-ID: <66c5c5a8-7a8b-aefc-6466-c7d20236550e@suse.com>
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
In-Reply-To: <20221110154521.613472-2-ross.philipson@oracle.com>

--------------dd6c6hUQlWDPpqABWqQLDgwl
Content-Type: multipart/mixed; boundary="------------5DbFnzzLZhZ4rEqvlNR47BD1"

--------------5DbFnzzLZhZ4rEqvlNR47BD1
Content-Type: text/plain; charset="UTF-8"; format=flowed

On 10.11.22 16:45, Ross Philipson wrote:
> There are a number of places where early_memremap is called
> but the return pointer is not checked for NULL. The call
> can result in a NULL being returned so the checks must
> be added.
> 
> Note that the maintainers for both the Jailhouse and Xen code
> approved of using panic() to handle allocation failures.
> 
> In addition to checking the return values, a bit of extra
> cleanup of pr_* usages was done since the pr_fmt macro was
> introduced in the modules touched by this patch.
> 
> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
> ---
>   arch/x86/kernel/devicetree.c | 13 +++++++++++
>   arch/x86/kernel/e820.c       | 12 +++++++++--
>   arch/x86/kernel/jailhouse.c  |  6 ++++++
>   arch/x86/kernel/mpparse.c    | 51 +++++++++++++++++++++++++++++++++-----------
>   arch/x86/kernel/setup.c      | 19 ++++++++++++++---
>   arch/x86/xen/enlighten_hvm.c |  2 ++
>   arch/x86/xen/mmu_pv.c        |  8 +++++++
>   arch/x86/xen/setup.c         |  2 ++
>   8 files changed, 95 insertions(+), 18 deletions(-)

For the Xen parts:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/66c5c5a8-7a8b-aefc-6466-c7d20236550e%40suse.com.

--------------5DbFnzzLZhZ4rEqvlNR47BD1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5DbFnzzLZhZ4rEqvlNR47BD1--

--------------dd6c6hUQlWDPpqABWqQLDgwl--

--------------mBxoMJgcAlsBu0oRWxNGGnrZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNtIdAFAwAAAAAACgkQsN6d1ii/Ey/Z
uwf9GfCYNTgYAn6tunrIu6M+RENPMwwvmUVC0CjrSU/ln3KvegZRL+VgXLxTe01E1j8c3VGle1xW
tzawO3vkDoilvke4V7OwBvIWKzgUJxNboCy5d9B2TOPbjZTi1qediSlKKv8K5Rckxe9ff/GLhcMr
yJzHkVbt8O1QzPN/sWEA0cKUG9DPRY5mKks9ysu1pF7gbaiRTKs8dSMg0q1XU7Cpaw33aozsaYlu
DMfWdMzGQFfQooVaJzJl2nHQR6RSb5lKouJ8lps4g0dZzGoFLD3SUIKfiMhRwQFltl7ej8S6W8U+
j7qVorWMIVyGqkPQFDZhgGI89ST+XlCqNVonfOCz6w==
=AnkP
-----END PGP SIGNATURE-----

--------------mBxoMJgcAlsBu0oRWxNGGnrZ--
